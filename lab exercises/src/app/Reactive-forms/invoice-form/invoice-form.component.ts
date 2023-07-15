import { Component} from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormArray } from '@angular/forms';

@Component({
  selector: 'app-invoice-form',
  templateUrl: './invoice-form.component.html',
  styleUrls: ['./invoice-form.component.scss']
})
export class InvoiceFormComponent {
  invoiceForm: FormGroup;
  totalNetValue: number = 0;
  totalVatValue: number = 0;
  totalGrossValue: number = 0;

  constructor(private formBuilder: FormBuilder) {
    this.invoiceForm = this.formBuilder.group({
      seller: this.formBuilder.group({
        name: ['', Validators.required],
        city: ['', Validators.required],
        address: ['', Validators.required],
        postalCode: ['', Validators.required],
        nip: ['', Validators.required],
        bankAccount: ['', Validators.required]
      }),
      buyer: this.formBuilder.group({
        name: [''],
        city: [''],
        address: [''],
        postalCode: [''],
        nip: ['']
      }),
      invoiceNumber: ['', Validators.required],
      issueDate: ['', Validators.required],
      saleDate: ['', Validators.required],
      paymentDeadline: ['', Validators.required],
      paymentMethod: ['', Validators.required],
      invoiceItems: this.formBuilder.array([])
    });

    // Subskrybuj zmiany formularza
    this.invoiceForm.valueChanges.subscribe(() => {
      this.calculateTotals();
    });
  }

  get invoiceItems() {
    return this.invoiceForm.get('invoiceItems') as FormArray;
  }

  addInvoiceItem() {
    const item = this.formBuilder.group({
      name: ['', Validators.required],
      quantity: ['', Validators.required],
      unit: ['', Validators.required],
      netPrice: ['', Validators.required],
      vatRate: ['', Validators.required],
      netValue: [{ value: '', disabled: true }],
      grossValue: [{ value: '', disabled: true }]
    });

    item.valueChanges.subscribe(() => {
      this.calculateItemValues(item);
    });

    this.invoiceItems.push(item);
  }

  calculateItemValues(item: FormGroup) {
    const quantity = item.get('quantity').value;
    const netPrice = item.get('netPrice').value;
    const vatRate = item.get('vatRate').value;

    if (quantity && netPrice && vatRate) {
      const netValue = quantity * netPrice;
      const vatValue = (netValue * vatRate) / 100;
      const grossValue = netValue + vatValue;

      item.get('netValue').setValue(netValue.toFixed(2));
      item.get('grossValue').setValue(grossValue.toFixed(2));
    }
  }

  calculateTotals() {
    this.totalNetValue = 0;
    this.totalVatValue = 0;
    this.totalGrossValue = 0;

    for (const item of this.invoiceItems.controls) {
      const netValue = parseFloat(item.get('netValue').value);
      const grossValue = parseFloat(item.get('grossValue').value);

      this.totalNetValue += netValue ? netValue : 0;
      this.totalGrossValue += grossValue ? grossValue : 0;

      const vatRate = parseFloat(item.get('vatRate').value);
      const vatValue = grossValue - netValue;

      this.totalVatValue += vatRate ? vatValue : 0;
    }

    this.totalNetValue = parseFloat(this.totalNetValue.toFixed(2));
    this.totalVatValue = parseFloat(this.totalVatValue.toFixed(2));
    this.totalGrossValue = parseFloat(this.totalGrossValue.toFixed(2));
  }

  onSubmit() {
    if (this.invoiceForm.valid) {
      console.log(this.invoiceForm.value);
      // Wyślij dane faktury do serwera lub wykonaj inne operacje
    } else {
      // Obsłuż błędy walidacji formularza
    }
  }
}


import { Component} from '@angular/core';
import { FormBuilder, FormGroup, Validators, FormArray } from '@angular/forms';

@Component({
  selector: 'app-invoice-form',
  templateUrl: './invoice-form.component.html',
  styleUrls: ['./invoice-form.component.scss']
})
export class InvoiceFormComponent {
  invoiceForm: FormGroup;

  constructor(private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.invoiceForm = this.formBuilder.group({
      issuer: this.formBuilder.group({
        name: ['', Validators.required],
        // Pozostałe pola dla danych wystawcy
      }),
      buyer: this.formBuilder.group({
        name: [''],
        // Pozostałe pola dla danych zamawiającego
      }),
      invoiceNumber: [''],
      issueDate: [''],
      saleDate: [''],
      paymentDeadline: [''],
      paymentMethod: [''],
      invoiceItems: this.formBuilder.array([])
    });
  }

  get invoiceItems() {
    return this.invoiceForm.get('invoiceItems') as FormArray;
  }

  addInvoiceItem() {
    const invoiceItem = this.formBuilder.group({
      name: ['', Validators.required],
      // Pozostałe pola dla pozycji faktury
    });

    this.invoiceItems.push(invoiceItem);
  }

  removeInvoiceItem(index: number) {
    this.invoiceItems.removeAt(index);
  }

  calculateNetTotal(): number {
    // Implementacja logiki obliczającej sumę kwot netto
    return 0;
  }

  calculateVatTotal(): number {
    // Implementacja logiki obliczającej sumę kwot VAT
    return 0;
  }

  calculateGrossTotal(): number {
    // Implementacja logiki obliczającej sumę kwot brutto
    return 0;
  }

  submitForm() {
    if (this.invoiceForm.valid) {
      // Logika obsługi wysyłki faktury
    } else {
      // Obsługa błędów walidacji
    }
  }
}

import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { Supplier } from 'src/app/models/supplier';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-suppliers',
  templateUrl: './suppliers.component.html',
  styleUrls: ['./suppliers.component.css']
})
export class SuppliersComponent {
  suppliers: Observable<Supplier[]>;
  constructor( private http:HttpService) {}

  ngOnInit() {
    this.suppliers = this.http.getSuppliers();
  }

}

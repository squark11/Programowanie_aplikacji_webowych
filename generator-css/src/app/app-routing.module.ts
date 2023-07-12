import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { CssGeneratorComponent } from './css-generator/css-generator.component';
import { InvoiceFormComponent } from './Reactive-forms/invoice-form/invoice-form.component';

const routes: Routes = [
  { path: '', component: InvoiceFormComponent },
  { path: 'form', component: InvoiceFormComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }

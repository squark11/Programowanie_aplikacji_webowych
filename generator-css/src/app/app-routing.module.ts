import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { CssGeneratorComponent } from './css-generator/css-generator.component';
import { InvoiceFormComponent } from './Reactive-forms/invoice-form/invoice-form.component';
import { RozgrzewkaComponent } from './rxjs/rozgrzewka/rozgrzewka.component';
import { DatyComponent } from './rxjs/daty/daty.component';
import { AppMouseCoordinatesComponent } from './rxjs/app-mouse-coordinates/app-mouse-coordinates.component';
import { AppMouseCoordinatesIntervalComponent } from './rxjs/app-mouse-coordinates-interval/app-mouse-coordinates-interval.component';
import { SearchBoxComponent } from './rxjs/search-box/search-box.component';

const routes: Routes = [
  { path: '', component: CssGeneratorComponent },
  { path: 'form', component: InvoiceFormComponent },
  { path: 'rxjs/rozgrzewka', component: RozgrzewkaComponent },
  { path: 'rxjs/daty', component: DatyComponent },
  { path: 'rxjs/app-mouse-cordinates', component: AppMouseCoordinatesComponent },
  { path: 'rxjs/app-mouse-cordinates-interval', component: AppMouseCoordinatesIntervalComponent },
  { path: 'rxjs/search-box', component: SearchBoxComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }

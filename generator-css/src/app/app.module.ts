import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { FormatowanieComponent } from './css-generator/formatowanie/formatowanie.component';
import { ShowFormattingComponent } from './css-generator/show-formatting/show-formatting.component';
import { CssGeneratorComponent } from './css-generator/css-generator.component';
import { InvoiceFormComponent } from './Reactive-forms/invoice-form/invoice-form.component';
import { AppRoutingModule } from './app-routing.module';
import { RozgrzewkaComponent } from './rxjs/rozgrzewka/rozgrzewka.component';
import { DatyComponent } from './rxjs/daty/daty.component';
import { AppMouseCoordinatesComponent } from './rxjs/app-mouse-coordinates/app-mouse-coordinates.component';
import { AppMouseCoordinatesIntervalComponent } from './rxjs/app-mouse-coordinates-interval/app-mouse-coordinates-interval.component';
import { SearchBoxComponent } from './rxjs/search-box/search-box.component';

@NgModule({
  declarations: [
    AppComponent,
    FormatowanieComponent,
    ShowFormattingComponent,
    CssGeneratorComponent,
    InvoiceFormComponent,
    RozgrzewkaComponent,
    DatyComponent,
    AppMouseCoordinatesComponent,
    AppMouseCoordinatesIntervalComponent,
    SearchBoxComponent,

  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

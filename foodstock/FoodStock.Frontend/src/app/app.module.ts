import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { ProductComponent } from './pages/product/product.component';
import { CategoryComponent } from './pages/category/category.component';
import { SuppliersComponent } from './pages/suppliers/suppliers/suppliers.component';
import { FormsModule } from '@angular/forms';
import { ProductsInCategoryComponent } from './pages/category/products-in-category/products-in-category.component';
import { ProductDetailsComponent } from './pages/product/product-details/product-details.component';
import { AddProductComponent } from './pages/product/addProduct/add-product/add-product.component';
import { ProductCoverComponent } from './shared/product-cover/product-cover.component';
import { EditProductComponent } from './pages/product/edit-product/edit-product.component';
import { SearchComponent } from './shared/search/search.component';
import { CategoryCoverComponent } from './shared/category-cover/category-cover.component';
import { EditComponent } from './pages/category/products-in-category/edit/edit.component';
import { AddCategoryComponent } from './pages/category/add-category/add-category.component';
import { ProducentsComponent } from './pages/producents/producents.component';
import { AuthModule } from './authorization/auth.module';


@NgModule({
  declarations: [
    AppComponent,
    ProductComponent,
    CategoryComponent,
    SuppliersComponent,
    ProductsInCategoryComponent,
    ProductDetailsComponent,
    AddProductComponent,
    ProductCoverComponent,
    EditProductComponent,
    SearchComponent,
    CategoryCoverComponent,
    EditComponent,
    AddCategoryComponent,
    ProducentsComponent
  ],
  imports: [
    FormsModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    CommonModule,
    AuthModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule { }

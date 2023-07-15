import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductComponent } from './pages/product/product.component';
import { CategoryComponent } from './pages/category/category.component';
import { SuppliersComponent } from './pages/suppliers/suppliers/suppliers.component';
import { AddProductComponent } from './pages/product/addProduct/add-product/add-product.component';
import { ProductDetailsComponent } from './pages/product/product-details/product-details.component';
import { EditProductComponent } from './pages/product/edit-product/edit-product.component';
import { ProductsInCategoryComponent } from './pages/category/products-in-category/products-in-category.component';
import { ProducentsComponent } from './pages/producents/producents.component';
import { authorizedGuard } from './authorization/authorized.guard';

const routes: Routes = [
  { path: '', component: ProductComponent},
  { path: 'products', component: ProductComponent},
  { path: 'products/:id', component: ProductDetailsComponent,canActivate:[authorizedGuard]},
  { path: 'add-product', component: AddProductComponent,canActivate:[authorizedGuard]},
  { path: 'edit-product/:id', component: EditProductComponent, canActivate:[authorizedGuard]},
  { path: 'category', component: CategoryComponent },
  { path: 'category/:id', component: ProductsInCategoryComponent },
  { path: 'supplier', component: SuppliersComponent,canActivate:[authorizedGuard]},
  { path: 'producents', component: ProducentsComponent ,canActivate:[authorizedGuard]},
 

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

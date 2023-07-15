import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { Product } from '../models/product';
import { Supplier } from '../models/supplier';
import { Producent } from '../models/producent';
import { User } from '../models/user';
import { Category } from '../models/category';

@Injectable({
  providedIn: 'root'
})
export class HttpService {
  constructor(private httpClient: HttpClient) {}

  getProducents(): Observable<Producent[]> {
    return this.httpClient.get<Producent[]>("http://localhost/api/producents");
  }
  getProducent(id: string): Observable<Producent> {
    return this.httpClient.get<Producent>("http://localhost/api/producents/"+id);
  }
  getProducts(): Observable<Product[]> {
    return this.httpClient.get<Product[]>("http://localhost/api/products");
  }
  getSuppliers(): Observable<Supplier[]> {
    return this.httpClient.get<Supplier[]>("http://localhost/api/suppliers");
  }
  getSupplier(id: string): Observable<Supplier> {
    return this.httpClient.get<Supplier>("http://localhost/api/suppliers/"+id);
  }
  getUsers(): Observable<User[]> {
    return this.httpClient.get<User[]>("http://localhost/api/users");
  }
  getUser(id:string): Observable<User> {
    return this.httpClient.get<User>("http://localhost/api/users/"+id);
  }
  getProduct(id: string): Observable<Product> {
    return this.httpClient.get<Product>('http://localhost/api/products/' + id);
  }
  getCategories():Observable<Category[]>{
    return this.httpClient.get<Category[]>("http://localhost/api/categories");
  }
  getCategory(categoryId: string):Observable<Category>{
    return this.httpClient.get<Category>('http://localhost/api/categories/'+ categoryId);
  }
  
  getProductsInCategory(id: string): Observable<Product[]> {
    return this.httpClient.get<Product[]>('http://localhost/api/products/byCategoryId?categoryId='+ id);
  }
}

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';
import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})
export class HttpProductsService {
  private url = 'http://localhost/api/products';
  constructor(private http:HttpClient) { }

  postProduct(product: Product){
    return this.http.post<Product>(this.url, product);
  }
  putProduct(product: Product){
    return this.http.put<Product>(this.url+ '/' + product.id, product);
  }

  deleteProduct(id: string):Observable<{}>{
    return this.http.delete<{}>(this.url+ '/' + id).pipe(tap(console.log));
  }
}

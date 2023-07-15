import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Category } from '../models/category';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HttpCategoryService {


  private url = 'http://localhost/api/categories';
  constructor(private http:HttpClient) { }

  postCategory(category: Category){
    return this.http.post<Category>(this.url, category);
  }

  putCategory(category: Category){
    return this.http.put<Category>(this.url+"/"+ category.id, category);
  }

  deleteCategory(id: string):Observable<{}>{
    return this.http.delete<{}>(this.url+"/"+id).pipe(tap(console.log));
  }
}

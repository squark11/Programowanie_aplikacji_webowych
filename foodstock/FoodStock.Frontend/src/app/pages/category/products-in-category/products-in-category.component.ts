import { Component } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Observable, map, switchMap } from 'rxjs';
import { Product } from 'src/app/models/product';
import { HttpService } from 'src/app/services/http.service';
import { Location } from '@angular/common';
import { Category } from 'src/app/models/category';
import { HttpCategoryService } from 'src/app/services/http-category.service';
import { FormsModule } from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-products-in-category',
  templateUrl: './products-in-category.component.html',
  styleUrls: ['./products-in-category.component.css']
})
export class ProductsInCategoryComponent {
  constructor(
    private http: HttpService, 
    private httpCategoryServices:HttpCategoryService,
    private route: ActivatedRoute,
    private location:Location,
    protected auth:AuthService
    ) {
  }

  products: Product[];
  view: Product[];
  category: Category;
  editIsActive: boolean = false;
  showDeleteConfirmation: boolean = false;
  
  ngOnInit(): void {
    this.route.paramMap
      .pipe(switchMap((params: ParamMap) => this.http.getProductsInCategory(params.get('id'))))
      .subscribe(products => {
        this.products = products;
        this.view = products;
      });
  
    this.route.paramMap
      .pipe(switchMap((params: ParamMap) => this.http.getCategory(params.get('id'))))
      .subscribe(category => {
        this.category = category;
      });
  }
  
  delete(categoryId: string): void {
    this.showDeleteConfirmation = true;
  }

  deleteConfirmed(categoryId: string): void {
    this.httpCategoryServices.deleteCategory(categoryId).subscribe(
      result => {
        console.log(result);
        this.goBack();
      },
      error => console.error(error)
    );
  }
  
  cancelDelete(): void {
    // Anuluj usunięcie
    this.showDeleteConfirmation = false;
  }

  search(searchValue: Product[]){
    if(searchValue){
      this.view=searchValue;
    }
  }

  goBack() {
    this.location.back();
  }

 

}

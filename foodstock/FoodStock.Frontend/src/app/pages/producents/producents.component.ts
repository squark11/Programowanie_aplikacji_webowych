import { Component } from '@angular/core';
import { Observable } from 'rxjs';
import { Producent } from 'src/app/models/producent';
import { HttpService } from 'src/app/services/http.service';

@Component({
  selector: 'app-producents',
  templateUrl: './producents.component.html',
  styleUrls: ['./producents.component.css']
})
export class ProducentsComponent {
  producents: Observable<Producent[]>;
  constructor( private http:HttpService) {}

  ngOnInit() {
    this.producents = this.http.getProducents();
  }

}

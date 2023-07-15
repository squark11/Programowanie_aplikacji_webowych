import { Injectable } from '@angular/core';
import { HttpService } from './http.service';
import { AuthService } from './auth.service';
import { Observable, filter, map, tap } from 'rxjs';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class ProfileService {
  
  private user_request: Observable<User>;

  constructor(private http: HttpService, private auth: AuthService) { }

  getUserProfile(): Observable<User> {
    if (!this.user_request) {
      this.user_request = this.auth.state.pipe(
        filter(state => state),
        map(() => this.auth.getCurrentUser()),
      );
    }

    return this.user_request;
  }
}

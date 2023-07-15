import { Injectable } from '@angular/core';
import { User } from '../models/user';
import { HttpService } from './http.service';
import { BehaviorSubject, map, tap, take } from 'rxjs';

interface Session {
  user: User;
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private session = new BehaviorSubject<Session>(null)

  isAuthenticated = false;

  constructor(private http: HttpService) { }

  state = this.session.pipe(
    map(session => !!session),
    tap(state => {
      this.isAuthenticated = state
    })
  );

  getCurrentUser(): User {
    const session = this.session.getValue();
    return session ? session.user : null;
  }

  login(credentials) {
    console.log(credentials);
    this.http.getUsers().subscribe(users => {
      const matchedUser = users.find(
        user => user.email === credentials.email && user.password === credentials.password
      );
      if (matchedUser) {
        const session: Session = {
          user: matchedUser,
        };
        this.session.next(session);
      }
    });
  }

  logout() {
    this.session.next(null) }
}

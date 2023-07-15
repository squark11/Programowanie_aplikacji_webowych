import { Component } from '@angular/core';
import { User } from './models/user';
import { ProfileService } from './services/profile.service';
import { Observable } from 'rxjs';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  isMenuHidden: boolean = false;
  menuTransform: number = 300;
  user:User;

  constructor(private profile:ProfileService, protected auth:AuthService){}

  ngOnInit(): void {
    this.profile.getUserProfile().subscribe(user=>this.user=user);
  }

  toggleMenu() {
    this.isMenuHidden = !this.isMenuHidden;
    this.menuTransform = this.isMenuHidden ? 0 : 300;
  }
  
}
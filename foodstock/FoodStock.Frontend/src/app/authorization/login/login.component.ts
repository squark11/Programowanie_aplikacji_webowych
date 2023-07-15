import { Component } from '@angular/core';
import { FormBuilder} from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  constructor(private auth: AuthService, private fb: FormBuilder) {}

  loginForm = this.fb.group({
    email: [''],
    password: ['']
  })

  login() {
    this.auth.login(this.loginForm.value);
  }
}
    // this.errorMessage = 'błąd'; // Reset error message

    // if (!this.email || !this.password) {
    //   this.errorMessage = 'Please enter email and password';
    //   return;
    // }

    // this.userService.loginUser(this.email, this.password).subscribe(
    //   users => {
    //     if (users.length > 0) {
    //       // Login successful
    //       // Redirect or perform any other actions
    //     } else {
    //       this.errorMessage = 'Invalid email or password';
    //     }
    //   },
    //   error => {
    //     this.errorMessage = 'An error occurred during login';
    //     console.error(error);
    //   }
    // );
  


import { Product } from "./product";
import { Role } from "./role";

export interface User {
    id?: string;
    email: string;
    password: string;
    firstName: string;
    surname: string;
    roleId: string;
    role: Role;
    products: Product[];
}
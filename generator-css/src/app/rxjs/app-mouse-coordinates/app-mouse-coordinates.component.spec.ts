import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AppMouseCoordinatesComponent } from './app-mouse-coordinates.component';

describe('AppMouseCoordinatesComponent', () => {
  let component: AppMouseCoordinatesComponent;
  let fixture: ComponentFixture<AppMouseCoordinatesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AppMouseCoordinatesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AppMouseCoordinatesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

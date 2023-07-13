import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AppMouseCoordinatesIntervalComponent } from './app-mouse-coordinates-interval.component';

describe('AppMouseCoordinatesIntervalComponent', () => {
  let component: AppMouseCoordinatesIntervalComponent;
  let fixture: ComponentFixture<AppMouseCoordinatesIntervalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AppMouseCoordinatesIntervalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AppMouseCoordinatesIntervalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

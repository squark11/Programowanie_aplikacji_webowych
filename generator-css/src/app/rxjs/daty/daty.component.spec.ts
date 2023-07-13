import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DatyComponent } from './daty.component';

describe('DatyComponent', () => {
  let component: DatyComponent;
  let fixture: ComponentFixture<DatyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DatyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DatyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

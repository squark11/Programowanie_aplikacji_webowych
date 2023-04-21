import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowFormattingComponent } from './show-formatting.component';

describe('ShowFormattingComponent', () => {
  let component: ShowFormattingComponent;
  let fixture: ComponentFixture<ShowFormattingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShowFormattingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ShowFormattingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

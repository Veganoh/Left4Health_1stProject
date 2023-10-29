import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuestionnaireinitialComponent } from './questionnaireinitial.component';

describe('QuestionnaireinitialComponent', () => {
  let component: QuestionnaireinitialComponent;
  let fixture: ComponentFixture<QuestionnaireinitialComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QuestionnaireinitialComponent]
    });
    fixture = TestBed.createComponent(QuestionnaireinitialComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

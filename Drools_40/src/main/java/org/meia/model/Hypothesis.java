package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Hypothesis extends Fact {
    private String description;

    private int counter;

    public Hypothesis(String description) {
        this.description = description;
        this.counter = 0;

        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String getDescription() {
        return description;
    }

    public int getCounter() {
        return counter;
    }

    @Override
    public String toString() {
        return description;
    }

    public void increment_counter(){
        this.counter += 1;
    }
}

package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Hypothesis extends Fact {
    private String description;

    public Hypothesis(String description) {
        this.description = description;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String getDescription() {
        return description;
    }

}

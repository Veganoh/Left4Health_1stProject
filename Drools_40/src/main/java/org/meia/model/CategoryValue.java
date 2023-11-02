package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class CategoryValue extends Fact{
    private String category;
    private int value;

    public CategoryValue (String category, int value) {
        this.category = category;
        this.value = value;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String getCategory() {
        return category;
    }

    public int getValue() {
        return value;
    }

    public String toString() {
        return (category + "\n" + value);
    }
}
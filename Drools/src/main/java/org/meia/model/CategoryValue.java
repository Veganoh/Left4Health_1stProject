package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class CategoryValue extends Fact{
    private String category;
    private String value;

    public CategoryValue (String category, String value) {
        this.category = category;
        this.value = value;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String getCategory() {
        return category;
    }

    public String getValue() {
        return value;
    }

    public String toString() {
        return (category + " = " + value);
    }
}
package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Conclusion extends Fact {

    //CONCLUSÕES DE ANSIEDADE ESPECIFICA
    public static final String GENERAL_ANXIETY = "Ansiedade Generalizada";
    public static final String PANIC_SYNDROME = "Síndrome de Pânico";
    public static final String PANIC_AGORAPHOBIA_SYNDROME = "Síndrome de Pânico com AgoraFobia";
    public static final String AGORAPHOBIA_SYNDROME = "AgoraFobia";
    public static final String SPECIFIC_PHOBIA = "Fobia Especifica";
    public static final String SELECTIVE_MUTISM = "Mutismo Seletivo";
    public static final String SEPARATION_ANXIETY = "Ansiedade de Separação";
    public static final String SOCIAL_PHOBIA = "Fobia Social";
    public static final String UNKNOWN = "Look for the the doctor!";


    private String description;

    public Conclusion(String description) {
        this.description = description;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String getDescription() {
        return description;
    }

    public String toString() {
        return ("Diagnosis: " + description);
    }

}

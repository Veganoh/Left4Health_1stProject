package org.meia.model;

import org.meia.anxietyDiagnosis.AnxietyDiagnosis;

public class Conclusion extends Fact {

    public static final String GENERAL_ANXIETY = "Ansiedade Generalizada";

    public static final String NOT_GENERAL_ANXIETY = "Não tem Ansiedade Generalizada";
    public static final String PANIC_SYNDROME = "Síndrome de Pânico";

    public static final String NOT_PANIC_SYNDROME = "Não tem Síndrome de Pânico";

    public static final String PANIC_AGORAPHOBIA_SYNDROME = "Síndrome de Pânico com AgoraFobia";

    public static final String NOT_PANIC_AGORAPHOBIA_SYNDROME = "Não tem Síndrome de Pânico com AgoraFobia";

    public static final String AGORAPHOBIA_SYNDROME = "AgoraFobia";

    public static final String NOT_AGORAPHOBIA_SYNDROME = "Não é AgoraFobia";

    public static final String SPECIFIC_PHOBIA = "Fobia Especifica";

    public static final String NOT_SPECIFIC_PHOBIA = "Não tem Fobia Especifica";

    public static final String SELECTIVE_MUTISM = "Mutismo Seletivo";

    public static final String NOT_SELECTIVE_MUTISM = "Não tem Mutismo Seletivo";

    public static final String SEPARATION_ANXIETY = "Ansiedade de Separação";

    public static final String NOT_SEPARATION_ANXIETY = "Não tem Ansiedade de Separação";

    public static final String SOCIAL_PHOBIA = "Fobia Social";

    public static final String NOT_SOCIAL_PHOBIA = "Fobia Social";



    private String description;

    public Conclusion(String description) {
        this.description = description;
        AnxietyDiagnosis.agendaEventListener.addRhs(this);
    }

    public String toString() {
        return (description);
    }

}

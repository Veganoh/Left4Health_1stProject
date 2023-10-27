package org.meia.model;

public class InitialConclusion {

    public static final String ANXIETY_AS_NORMAL_FACTOR = "Ansiedade como condição do ser humano";
    public static final String ANXIETY_SECONDARY_FACTOR = "Tratar condição clínica e reavaliar persistência ou não dos sintomas de ansiedade após tratamento";
    public static final String ANXIETY_MEDS_FACTOR = "Reavaliar necessidade dos medicamentos, tratar abuso de substância ou síndrome de abstinência e após reavaliar persistência ou não dos sintomas ansiosos.";
    public static final String CHECK_THE_DOCTOR = "Contactar um Especialista";
    public static final String START_QUIZ40 = "Vai iniciar um questionário de 40 perguntas";

    private String description;

    public InitialConclusion(String description) {
        super();
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public String toString() {
        return ("Diagnosis: " + description);
    }
    }

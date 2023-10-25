package org.meia;

import org.meia.model.*;

import com.google.gson.Gson;

import java.io.FileReader;
import java.io.IOException;

public class JsonReader {

    private static String FILEPATH_INITIAL = "src/main/resources/meia/quizInitial.json";

    private static String FILEPATH_40 = "src/main/resources/meia/quiz40.json";


    public static String getFILEPATH_INITIAL() {
        return FILEPATH_INITIAL;
    }

    public static String getFILEPATH_40() {
        return FILEPATH_40;
    }

    public static Quiz readQuizInitial() {
        try {
            // Criar um objeto Gson para fazer a desserialização
            Gson gson = new Gson();

            // Ler o arquivo JSON em um objeto Quiz
            Quiz quiz = gson.fromJson(new FileReader(getFILEPATH_INITIAL()), Quiz.class);

            return quiz;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }


    public void readQuiz40(Quiz previousQuiz) {
        try {
            // Criar um objeto Gson para fazer a desserialização
            Gson gson = new Gson();

            // Ler o arquivo JSON em um objeto Quiz
            Quiz quiz = gson.fromJson(new FileReader(getFILEPATH_40()), Quiz.class);

            previousQuiz.setQuiz40(quiz.getQuiz40());

           // return previousQuiz;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

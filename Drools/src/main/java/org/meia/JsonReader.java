package org.meia;

import org.meia.model.Question;
import org.meia.model.QuestionCategory;
import org.meia.model.Quiz;

import com.google.gson.Gson;
import org.meia.model.QuizInitial;

import java.io.FileReader;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class JsonReader {

    private String FILEPATH="C:/Users/mariana/Documents/GitHub/Left4Health_1stProject/Drools/src/main/resources/meia/quiz.json";

    public void printJsonFromResource(Quiz quiz) {
        System.out.println("Versão: " + quiz.getVersion());

        System.out.println("Perguntas do QuizInitial:");
        for (Question pergunta : quiz.getQuizInitial()) {
            System.out.println("ID: " + pergunta.getId());
            System.out.println("Pergunta: " + pergunta.getQuestion());
        }

        System.out.println("Categorias e perguntas do Quiz40:");
        for (QuestionCategory categoria : quiz.getQuiz40()) {
            System.out.println("Categoria: " + categoria.getCategory());
            System.out.println("Perguntas:");
            for (Question pergunta : categoria.getCategoryQuestionList()) {
                System.out.println("ID: " + pergunta.getId());
                System.out.println("Pergunta: " + pergunta.getQuestion());
            }
        }
    }

    public void printJsonFromResource2(QuizInitial quiz) {

        System.out.println("Perguntas do QuizInitial:");
        for (Question pergunta : quiz.getQuestionList()) {
            System.out.println("ID: " + pergunta.getId());
            System.out.println("Pergunta: " + pergunta.getQuestion());
        }


    }

    public Quiz readJsonFromFile(){
        try {
            Gson gson = new Gson();
            Quiz quiz = gson.fromJson(new FileReader(this.FILEPATH), Quiz.class);
            return quiz;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public QuizInitial readQuizInitial(){
        try {
            Gson gson = new Gson();
            QuizInitial quizInitial = gson.fromJson(new FileReader(this.FILEPATH), QuizInitial.class);
            return quizInitial;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

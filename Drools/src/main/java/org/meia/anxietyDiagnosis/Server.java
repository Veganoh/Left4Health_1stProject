package org.meia.anxietyDiagnosis;

import java.io.IOException;
import java.io.OutputStream;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.net.InetSocketAddress;

import java.util.List;

import org.meia.model.Question;
import org.meia.model.Quiz;


public class Server {

    private static final int serverPort = 8080;

    private static Quiz quiz;

    public static void main(String[] args) throws IOException {
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);
        server.createContext("/api/drools", new HelloHandler());
        server.createContext("/api/quizInitial", new ObtainQuiz());

        server.setExecutor(null);
        server.start();
        System.out.println("Servidor Drools a rodar na porta " + serverPort);
    }

    static class ObtainQuiz implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            System.out.println("hey");
            List<Question> questions = quiz.getQuizInitial();
            StringBuilder responseBuilder = new StringBuilder();
            System.out.println("hey");

            for(Question question : questions){
                responseBuilder.append(question.getId())
                        .append("\n")
                        .append(question.getQuestionType())
                        .append("\n")
                        .append(question.getQuestion())
                        .append("\n");
            }
            System.out.println("hey");

            String response = responseBuilder.toString();
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            System.out.println("hey");

            os.write(response.getBytes());
            os.close();
        }
    }

    static class HelloHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = "This is the response";
            long threadId = Thread.currentThread().getId();
            System.out.println("I am thread " + threadId );
            response = response + "Thread Id = "+threadId;
            t.sendResponseHeaders(200, response.length());
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}

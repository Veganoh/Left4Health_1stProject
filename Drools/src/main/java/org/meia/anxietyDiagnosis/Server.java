package org.meia.anxietyDiagnosis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.net.InetSocketAddress;


import org.meia.model.Quiz;


public class Server {

    private static final int serverPort = 8080;

    private static Quiz quiz;

    public static void main(String[] args) throws IOException {
        quiz = new Quiz();
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);
        server.createContext("/api/obtainInitialQuestions", new ObtainInitialQuiz());
        server.createContext("/api/obtain40Questions", new ObtainQuiz40());

        server.createContext("/api/answerQuizInitial", new ObtainInitialQuizResponse());
        server.createContext("/api/answerQuiz40", new ObtainQuiz40Response());
        server.setExecutor(null);
        server.start();
        System.out.println("Servidor Drools a rodar na porta " + serverPort);
    }

    static class ObtainInitialQuiz implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = quiz.generateInitialQuizString();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class ObtainQuiz40 implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            String response = quiz.generateQuiz40String();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }


    static class ObtainInitialQuizResponse implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            InputStreamReader isr = new InputStreamReader(t.getRequestBody(), "utf-8");
            BufferedReader br = new BufferedReader(isr);
            StringBuilder buf = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                buf.append(line);
                buf.append("\n");
            }
            br.close();
            isr.close();

            String answers = buf.toString();
            Reader.assignAnswersToQuiz(quiz,answers);

            AnxietyDiagnosis.runEngine(quiz);

            String response = AnxietyDiagnosis.initialConclusion.toString();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class ObtainQuiz40Response implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            InputStreamReader isr = new InputStreamReader(t.getRequestBody(), "utf-8");
            BufferedReader br = new BufferedReader(isr);
            StringBuilder buf = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                buf.append(line);
                buf.append("\n");
            }
            br.close();
            isr.close();

            String answers = buf.toString();
            Reader.assignAnswersToQuiz(quiz,answers);
            AnxietyDiagnosis.runEngine40(quiz);


            // mudar isto
            String response = AnxietyDiagnosis.initialConclusion.toString();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}
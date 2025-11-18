import com.sun.net.httpserver.Headers;
import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class SimpleStaticServer {

    private static final Map<String, String> MIME = new HashMap<>();
    static {
        MIME.put("html", "text/html; charset=UTF-8");
        MIME.put("htm",  "text/html; charset=UTF-8");
        MIME.put("css",  "text/css; charset=UTF-8");
        MIME.put("js",   "application/javascript; charset=UTF-8");
        MIME.put("json", "application/json; charset=UTF-8");
        MIME.put("svg",  "image/svg+xml");
        MIME.put("png",  "image/png");
        MIME.put("jpg",  "image/jpeg");
        MIME.put("jpeg", "image/jpeg");
        MIME.put("gif",  "image/gif");
        MIME.put("txt",  "text/plain; charset=UTF-8");
        // 可按需补充
    }

    public static void main(String[] args) throws Exception {
        int port = args.length > 0 ? Integer.parseInt(args[0]) : 5173;
        Path root = Paths.get(args.length > 1 ? args[1] : ".").toAbsolutePath().normalize();

        HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);
        System.out.println("Serving " + root + " at http://localhost:" + port);

        server.createContext("/", new FileHandler(root));
        server.setExecutor(null);
        server.start();
    }

    static class FileHandler implements HttpHandler {
        private final Path root;

        FileHandler(Path root) {
            this.root = root;
        }

        @Override
        public void handle(HttpExchange ex) throws IOException {
            String rawPath = ex.getRequestURI().getPath();
            String pathStr = URLDecoder.decode(rawPath, "UTF-8");

            // 默认到根目录
            if (pathStr.equals("/")) {
                pathStr = "/simple-interface-prototype-fetch.html";
            }

            Path target = root.resolve("." + pathStr).normalize();
            // 安全：禁止跳出根目录
            if (!target.startsWith(root)) {
                send(ex, 403, "Forbidden");
                return;
            }

            if (!Files.exists(target) || Files.isDirectory(target)) {
                send(ex, 404, "Not Found");
                return;
            }

            String ext = getExt(target.getFileName().toString());
            String mime = MIME.getOrDefault(ext, "application/octet-stream");

            Headers h = ex.getResponseHeaders();
            h.set("Content-Type", mime);
            // 允许前端从 http://localhost:5173 调 http://localhost:3000
            h.set("Access-Control-Allow-Origin", "*");

            byte[] bytes = Files.readAllBytes(target);
            ex.sendResponseHeaders(200, bytes.length);
            try (OutputStream os = ex.getResponseBody()) {
                os.write(bytes);
            }
        }

        private static String getExt(String name) {
            int i = name.lastIndexOf('.');
            return (i >= 0 && i < name.length() - 1) ? name.substring(i + 1).toLowerCase() : "";
        }

        private static void send(HttpExchange ex, int code, String msg) throws IOException {
            byte[] b = msg.getBytes("UTF-8");
            ex.getResponseHeaders().set("Content-Type", "text/plain; charset=UTF-8");
            ex.getResponseHeaders().set("Access-Control-Allow-Origin", "*");
            ex.sendResponseHeaders(code, b.length);
            try (OutputStream os = ex.getResponseBody()) {
                os.write(b);
            }
        }
    }
}

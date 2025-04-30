<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>ASCII Art Generator</title>
    <style>
        /* Global styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #4CAF50;
            text-align: center;
        }

        .ascii-container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 900px;
            margin-top: 30px;
            text-align: center;
            font-size: 1.1em;
        }

        /* Form styles */
        form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        label {
            font-size: 1.1em;
            color: #555;
        }

        input[type="text"] {
            padding: 10px 15px;
            font-size: 1.2em;
            border: 2px solid #4CAF50;
            border-radius: 5px;
            width: 300px;
            transition: border 0.3s;
        }

        input[type="text"]:focus {
            border-color: #388E3C;
            outline: none;
        }

        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }

        /* ASCII Art styles */
        pre {
            font-family: 'Courier New', Courier, monospace;
            font-size: 1.2em;
            line-height: 1.5;
            white-space: pre-wrap;
            word-wrap: break-word;
            margin: 0;
            background-color: #f7f7f7;
            padding: 15px;
            border-radius: 8px;
            overflow-x: auto;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            display: inline-block;
            margin-top: 20px;
            max-width: 100%;
            text-align: left;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            input[type="text"] {
                width: 250px;
            }

            button {
                font-size: 1.1em;
            }
        }
    </style>
</head>
<body>

    <h1>ASCII Art Generator</h1>

    <form method="post">
        <label for="inputText">Entrez un mot :</label>
        <input type="text" id="inputText" name="inputText" required />
        <button type="submit">Afficher</button>
    </form>

    <div class="ascii-container">
    <%
        String inputText = request.getParameter("inputText");
        if (inputText != null && !inputText.trim().isEmpty()) {
            String textToPrint = inputText.toUpperCase();

            int L = 4;
            int H = 5;

            String[] asciiAlphabet = {
                " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
                "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
                "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
                "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
                "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
            };

            for (int row = 0; row < H; row++) {
                out.print("<pre>");
                for (char ch : textToPrint.toCharArray()) {
                    int index = (ch >= 'A' && ch <= 'Z') ? ch - 'A' : 26;
                    int start = index * L;
                    out.print(asciiAlphabet[row].substring(start, start + L));
                }
                out.println("</pre>");
            }
        }
    %>
    </div>

</body>
</html>

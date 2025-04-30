<%
String textToPrint = "MANHATTAN";

// Width and height of each character
int L = 4;
int H = 5;

// The ASCII art alphabet (A-Z + '?')
String[] asciiAlphabet = {
    " #  ##   ## ##  ### ###  ## # # ###  ## # # #   # # ###  #  ##   #  ##   ## ### # # # # # # # # # # ### ### ",
    "# # # # #   # # #   #   #   # #  #    # # # #   ### # # # # # # # # # # #    #  # # # # # # # # # #   #   # ",
    "### ##  #   # # ##  ##  # # ###  #    # ##  #   ### # # # # ##  # # ##   #   #  # # # # ###  #   #   #   ## ",
    "# # # # #   # # #   #   # # # #  #  # # # # #   # # # # # # #    ## # #   #  #  # # # # ### # #  #  #       ",
    "# # ##   ## ##  ### #    ## # # ###  #  # # ### # # # #  #  #     # # # ##   #  ###  #  # # # #  #  ###  #  "
};

textToPrint = textToPrint.toUpperCase();

// Render the ASCII art line by line
for (int row = 0; row < H; row++) {
    out.print("<pre style='font-family: monospace; margin: 0;'>");
    for (char ch : textToPrint.toCharArray()) {
        int index = (ch >= 'A' && ch <= 'Z') ? ch - 'A' : 26; // Fallback to '?' if not A-Z
        int start = index * L;
        out.print(asciiAlphabet[row].substring(start, start + L));
    }
    out.println("</pre>");
}
%>


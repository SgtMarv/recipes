module ApplicationHelper

    def lesc(text)
        LatexToPdf.escape_latex(text)
    end

    def tex2html(text)
        html = text
        html.gsub!("\r", '<br>')
        html.gsub!("\\begin{itemize}", "<ul>")
        html.gsub!("\\item", "</li><li>")
        html.gsub!("\\end{itemize}", "</li></ul>")

        html.html_safe
    end

end

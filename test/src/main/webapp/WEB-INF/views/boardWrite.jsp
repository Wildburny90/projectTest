<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./resources/js/Trumbowyg-master/dist/ui/trumbowyg.css">
    <meta charset="utf-8">
    <title>CKEditor</title>
</head>
<body>
<div id="textEditor"></div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-3.1.1.min.js"><\/script>')</script>
<script src="./resources/js/Trumbowyg-master/dist/trumbowyg.js"></script>
<script type="text/javascript" src=".\resources\js\Trumbowyg-master\dist\langs\ko.min.js"></script>
<script src=".\resources\js\Trumbowyg-master\dist\plugins\upload\trumbowyg.upload.js"></script>
<script>
    $('#textEditor')
        .trumbowyg({
            btnsDef: {
                // Create a new dropdown
                image: {
                    dropdown: ['insertImage', 'upload'],
                    ico: 'insertImage'
                }
            },
            // Redefine the button pane
            btns: ['viewHTML',
                '|', 'formatting',
                '|', 'btnGrp-semantic',
                '|', 'link',
                '|', 'image',
                '|', 'btnGrp-justify',
                '|', 'btnGrp-lists',
                '|', 'horizontalRule'],
            lang: 'ko'
        });

</script>
</body>
</html>

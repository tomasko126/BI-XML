<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/countries">
        <html>
            <head>
                <title>Countries</title>

                <!-- CSS styles -->
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
                <link rel="stylesheet"
                      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"/>
                <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css"
                      integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w"
                      crossorigin="anonymous"/>
                <link rel="stylesheet" href="style.css"/>

                <!-- JS scripts -->
                <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"/>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"/>

            </head>
            <body>
                <div class="navbar-fixed">
                    <nav>
                        <div class="nav-wrapper">
                            <ul class="center hide-on-med-and-down">
                                <li>
                                    <a href="index.html">Index</a>
                                </li>
                                <xsl:for-each select="country">
                                    <li>
                                        <a href="{@iso-code}.html">
                                            <xsl:value-of select="government/country-name/@short-form"></xsl:value-of>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </nav>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
<!DOCTYPE html>
<html>

 <#import "components.ftl" as c>
 

<head>
    <meta charset="utf-8">
    <title>WebComponent based components</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Badges</h1>
        <div> This is a <@c.badge type="danger" caption="Badge"></@c.badge>
        </div>

        <h1 class="mt-5">Buttons</h1>
        <@c.button>Simple preact-button</@c.button>
        <hr />
        <@c.button style="cta" additionalClasses="text-uppercase">CTA preact-button with uppercase</@c.button>
        <hr />
        <@c.button additionalAttributes={"data-foo": "bar", "aria-live": "polite"}>preact-button with additional attributes</@c.button>
        <hr />
        <@c.button type="button" name="action" value="delete">preact-button with name and value</@c.button>

        <h1 class="mt-5">Cards</h1>
        <#assign headerContent><span lang="de">Großartige</span> Card</span></#assign>
        <@c.card headingLevel="2" heading=headerContent footer="This is the footer!"> 
            Welcome to the <strong>best card</strong>
        </@c.card>
        <hr />
        <@c.card headingLevel="2" heading="Another preact-card with a Link as Header" href="#foo"> Content baby! </@c.card>

        <h1 class="mt-5">List</h1>
        <#assign colorContent><span lang="de">Etwas</span> text</#assign>
        <@c.list items={"Type": "Car", "Color": colorContent} />
        
        <h1 class="mt-5">MagicHeaders</h1>
        <@c.mhSection ; headingLevel>
            <article>
                <header>
                    <@c.mhHeading headingLevel=headingLevel>Some h1</@c.mhHeading>
                    <p class="tagline"> Content </p>
                </header>
                <@c.mhSection parentHeadingLevel=headingLevel ; headingLevel>
                    <section>
                        <@c.mhHeading headingLevel=headingLevel>Some h2</@c.mhHeading>
                    </section>
                    <p>Some more content</p>
                    <@c.mhSection parentHeadingLevel=headingLevel ; headingLevel>
                        <div class="foo bar">
                            <@c.mhHeading headingLevel=headingLevel>Some h3</@c.mhHeading>
                        </div>
                        <p>Some more content</p>
                    </@c.mhSection>
                </@c.mhSection>
                <@c.mhSection parentHeadingLevel=headingLevel ; headingLevel>
                    <section>
                        <@c.mhHeading headingLevel=headingLevel>Again some h2</@c.mhHeading>
                    </section>
                    <p>Some more content</p>
                </@c.mhSection>
            </article>
        </@c.mhSection>

        <h1 class="mt-5">Form Group</h1>
        <@c.fieldGroup label="Very Simple!" name="test"/>
        <hr>
        <@c.fieldGroup type="email" id="my-email" label="eMail" name="users_email" value="BOOM" error="'BOOM' is not a valid eMail addreess" />
    </div>
</body>

</html>

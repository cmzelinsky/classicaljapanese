var allSpans = document.getElementsByTagName("span")
var colors = { "verb": "green", "inflSuffix": "blue"}

function clearHighlights() 
{   
    var target = document.getElementsByTagName('span');
    for (var i = 0; i < target.length; i++) 
    {
        
        target[i].style.backgroundColor = "";
     }
}

function highlightElement(currentElement)
{
    clearHighlights();
    var id = currentElement.getAttribute("id");
    var color = colors[id];
    var targets = [];
    for (var j = 0; j<allSpans.length; j++)
    {
        if (allSpans[j].getAttribute("class") == id)
        {
            targets.push(allSpans[j]);
        }
        for (var i = 0; i < targets.length; i++)
        {
            targets[i].style.backgroundColor = color;
        }
    }
}

function highlightElements(id)
{
    var color = colors[id];
    var targets = [];
    for (var j = 0; j<allSpans.length; j++)
    {
        if (allSpans[j].getAttribute("class") == id)
        {
            targets.push(allSpans[j]);
        }
        for (var i = 0; i < targets.length; i++)
        {
            targets[i].style.backgroundColor = color;
        }
    }
}

function highlightAll()
{
    var ids = []
    for (var j = 0; j<allSpans.length; j++)
    {
        var thisId = allSpans[j].getAttribute('id')
        if (thisId != null && ids.indexOf(thisId) == -1)
        {
            ids.push(thisId)
        }
    }
    for (var k = 0; k<ids.length; k++)
    {
        highlightElements(ids[k], colors[ids[k]]);
    }
}
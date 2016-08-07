
<div id="Welcome">
    <div id="WelcomeContent">
    Welcome ${sessionScope.accountBean.account.firstName}!
    </div>
</div>

<div id="Main">
    <div id="Sidebar">
        <div id="SidebarContent">
            <a href="${base}/catalog/viewCategory?categoryId=FISH"><img src="${base}/static/images/fish_icon.gif" /></a> <br />
            Saltwater, Freshwater <br /><br />
            <a href="${base}/catalog/viewCategory?categoryId=DOGS"><img src="${base}/static/images/dogs_icon.gif" /></a> <br />
            Various Breeds <br /><br />
            <a href="${base}/catalog/viewCategory?categoryId=CATS"><img src="${base}/static/images/cats_icon.gif" /></a> <br />
            Various Breeds, Exotic Varieties <br /><br />
            <a href="${base}/catalog/viewCategory?categoryId=REPTILES"><img src="${base}/static/images/reptiles_icon.gif" /></a> <br />
            Lizards, Turtles, Snakes <br /><br />
            <a href="${base}/catalog/viewCategory?categoryId=BIRDS"><img src="${base}/static/images/birds_icon.gif" /></a> <br />
            Exotic Varieties
        </div>
    </div>

    <div id="MainImage">
        <div id="MainImageContent">
            <map name="estoremap">
                <area alt="Birds" coords="72,2,280,250" href="${base}/catalog/viewCategory?categoryId=BIRDS" shape="RECT" />
                <area alt="Fish" coords="2,180,72,250" href="${base}/catalog/viewCategory?categoryId=FISH" shape="RECT" />
                <area alt="Dogs" coords="60,250,130,320" href="${base}/catalog/viewCategory?categoryId=DOGS" shape="RECT" />
                <area alt="Reptiles" coords="140,270,210,340" href="${base}/catalog/viewCategory?categoryId=REPTILES" shape="RECT" />
                <area alt="Cats" coords="225,240,295,310" href="${base}/catalog/viewCategory?categoryId=CATS" shape="RECT" />
                <area alt="Birds" coords="280,180,350,250" href="${base}/catalog/viewCategory?categoryId=BIRDS" shape="RECT" />
            </map>
            <img height="355" src="${base}/static/images/splash.gif" align="middle" usemap="#estoremap" width="350" />
        </div>
    </div>

    <div id="Separator">&nbsp;</div>
</div>



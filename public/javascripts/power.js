if(typeof $WH=="undefined"){$WH={wowheadRemote:true}}if(typeof $WowheadPower=="undefined"){var $WowheadPower=new function(){var V=$WH.wowheadRemote;var z={applyto:3},t=document.getElementsByTagName("head")[0],H=true,i,P,T,K,v,Z,N,L,k=0,ad=false,O={},j={},A={},I={},U={},af={},g={},f={},Y=1,C=1,S=0,Q=1,l=2,w=3,R=4,x=1,n=2,E=3,J=5,y=6,q=10,m=100,s=15,G=15,D={loading:"Loading...",noresponse:"No response from server :(",achievementcomplete:"Achievement earned by $1 on $2/$3/$4"},u={1:[O,"npc","NPC"],2:[j,"object","Object"],3:[A,"item","Item"],5:[I,"quest","Quest"],6:[U,"spell","Spell"],10:[af,"achievement","Achievement"],100:[f,"profile","Profile"]},e={0:"enus",2:"frfr",3:"dede",6:"eses",7:"ruru",ptr:"ptr",beta:"beta"},c={wotlk:"www"};if(V){var b={getId:function(){return 0},getName:function(){return"enus"}}}if(H){}else{c.ptr="www"}function aa(){if(V){var ag=document.createElement("script");ag.src=document.location.protocol+"//static.wowhead.com/js/basic.js?5";t.appendChild(ag)}else{W()}}function W(){if(ad){return}ad=true;$WH.aE(document,"mouseover",B)}this.init=function(){if(V){$WH.ae(t,$WH.ce("link",{type:"text/css",href:document.location.protocol+"//static.wowhead.com/css/basic.css?5",rel:"stylesheet"}))}W()};function r(ag){var ah=$WH.g_getCursorPos(ag);N=ah.x;L=ah.y}function ac(au,ap){if(au.nodeName!="A"&&au.nodeName!="AREA"){return -2323}if(!au.href.length){return}if(au.rel&&au.rel.indexOf("np")!=-1){return}var al,ak,ai,ah,am={};v=am;var ag=function(av,ax,aw){if(ax=="buff"||ax=="sock"){am[ax]=true}else{if(ax=="rand"||ax=="ench"||ax=="lvl"||ax=="c"){am[ax]=parseInt(aw)}else{if(ax=="gems"||ax=="pcs"){am[ax]=aw.split(":")}else{if(ax=="who"||ax=="domain"){am[ax]=aw}else{if(ax=="when"){am[ax]=new Date(parseInt(aw))}}}}}};var ao=false;if(z.applyto&1){ak=2;ai=3;if(au.href.indexOf("http://")==0){al=1;ah=au.href.match(/^http:\/\/(.+?)?\.?(?:wowhead|thottbot)\.com\/\??(item|quest|spell|achievement|statistic|npc|object)=([0-9]+)/);if(ah==null){ah=au.href.match(/^http:\/\/(.+?)?\.?(?:wowhead|thottbot)\.com\/\??(profile)=([^&#]+)/)}C=0}else{ao=true;ah=au.href.match(/()\/\??(item|quest|spell|achievement|statistic|npc|object)=([0-9]+)/);if(ah==null){ah=au.href.match(/()\/\??(profile)=([^&#]+)/)}C=1}}if(ah==null&&au.rel&&(z.applyto&2)){al=0;ak=1;ai=2;ah=au.rel.match(/(item|quest|spell|achievement|statistic|npc|object).?([0-9]+)/);if(ah==null){ah=au.rel.match(/(profile).?([^&#]+)/)}C=1}au.href.replace(/([a-zA-Z]+)=?([a-zA-Z0-9:-]*)/g,ag);if(au.rel){au.rel.replace(/([a-zA-Z]+)=?([a-zA-Z0-9:-]*)/g,ag)}if(am.gems&&am.gems.length>0){var an;for(an=Math.min(3,am.gems.length-1);an>=0;--an){if(parseInt(am.gems[an])){break}}++an;if(an==0){delete am.gems}else{if(an<am.gems.length){am.gems=am.gems.slice(0,an)}}}if(ah){var at,aj="www";Z=au;if(am.domain){aj=am.domain}else{if(al&&ah[al]){aj=ah[al]}else{if(ao){if($WH.isset("g_beta")&&g_beta){aj="cata"}else{if($WH.isset("g_ptr")&&g_ptr){aj="ptr"}else{if($WH.isset("g_old")&&g_old){aj="old"}}}}}}if(c[aj]){aj=c[aj]}at=$WH.g_getLocaleFromDomain(aj);if(aj=="ptr"){at="ptr"}else{if(aj=="beta"||aj=="cata"){at="beta"}}K=aj;if(au.href.indexOf("#")!=-1&&document.location.href.indexOf(ah[ak]+"="+ah[ai])!=-1){return}k=((au.parentNode.className.indexOf("icon")==0&&au.parentNode.nodeName=="DIV")?1:0);if(!au.onmouseout){if(k==0){au.onmousemove=a}au.onmouseout=ab}r(ap);var ar=$WH.g_getIdFromTypeName(ah[ak]),aq=ah[ai];F(ar,aq,at,am)}}function B(ai){ai=$WH.$E(ai);var ah=ai._target;var ag=0;while(ah!=null&&ag<5&&ac(ah,ai)==-2323){ah=ah.parentNode;++ag}}function a(ag){ag=$WH.$E(ag);r(ag);$WH.Tooltip.move(N,L,0,0,s,G)}function ab(){i=null;Z=null;$WH.Tooltip.hide()}function X(ag){return(v&&v.buff?"buff_":"tooltip_")+e[ag]}function o(ah,aj,ai){var ag=u[ah][0];if(ag[aj]==null){ag[aj]={}}if(ag[aj].status==null){ag[aj].status={}}if(ag[aj].status[ai]==null){ag[aj].status[ai]=S}}function F(ah,al,aj,ak){if(!ak){ak={}}var ai=h(al,ak);i=ah;P=ai;T=aj;v=ak;o(ah,ai,aj);var ag=u[ah][0];if(ag[ai].status[aj]==R||ag[ai].status[aj]==w){ae(ag[ai][X(aj)],ag[ai].icon)}else{if(ag[ai].status[aj]==Q){ae(D.loading)}else{d(ah,al,aj,null,ak)}}}function d(ap,ak,aq,ai,al){var ag=h(ak,al);var an=u[ap][0];if(an[ag].status[aq]!=S&&an[ag].status[aq]!=l){return}an[ag].status[aq]=Q;if(!ai){an[ag].timer=setTimeout(function(){p.apply(this,[ap,ag,aq])},333)}var aj="";for(var am in al){if(am!="rand"&&am!="ench"&&am!="gems"&&am!="sock"){continue}if(typeof al[am]=="object"){aj+="&"+am+"="+al[am].join(":")}else{if(am=="sock"){aj+="&sock"}else{aj+="&"+am+"="+al[am]}}}var ao=$WH.g_getDomainFromLocale(aq);if(aq=="ptr"){ao="ptr"}else{if(aq=="beta"){ao="cata"}}var ah="";if(typeof g_dev=="undefined"||!g_dev){ah+=document.location.protocol+"//"+ao+".wowhead.com"}else{if(window.location.hostname.indexOf("dev.wowhead.com")!=-1){if(ao!="www"&&window.location.hostname.indexOf(ao)!=0){ah+=document.location.protocol+"//"+ao+"."+window.location.hostname}}}ah+="/"+u[ap][1]+"="+ak+"&power"+aj;$WH.g_ajaxIshRequest(ah)}function ae(aj,ak){if(Z&&Z._fixTooltip){aj=Z._fixTooltip(aj,i,P,Z)}var al=false;if(!aj){aj=u[i][2]+" not found :(";ak="inv_misc_questionmark";al=true}else{if(v!=null){if(v.pcs&&v.pcs.length){var am=P.match(/^(\d+)/);am=am[1];var an=0;for(var ai=0,ah=v.pcs.length;ai<ah;++ai){var ag;if(ag=aj.match(new RegExp("<span><!--si([0-9]+:)*"+v.pcs[ai]+'(:[0-9]+)*--><a href="/??item=(\\d+)">(.+?)</a></span>'))){aj=aj.replace(ag[0],'<span class="q8"><!--si'+v.pcs[ai]+'--><a href="/item='+ag[3]+'">'+(($WH.isset("g_items")&&g_items[v.pcs[ai]])?g_items[v.pcs[ai]]["name_"+e[T]]:ag[4])+"</a></span>");++an}}if(an>0){aj=aj.replace("(0/","("+an+"/");aj=aj.replace(new RegExp("<span>\\(([0-"+an+"])\\)","g"),'<span class="q2">($1)')}}if(v.lvl){aj=$WH.g_setTooltipLevel(aj,v.lvl,v.buff)}if(v.who&&v.when){aj=aj.replace("<table><tr><td><br />",'<table><tr><td><br /><span class="q2">'+$WH.sprintf(D.achievementcomplete,v.who,v.when.getMonth()+1,v.when.getDate(),v.when.getFullYear())+"</span><br /><br />");aj=aj.replace(/class="q0"/g,'class="r3"')}}}if(k==1){$WH.Tooltip.setIcon(null);$WH.Tooltip.show(Z,aj)}else{$WH.Tooltip.setIcon(ak);$WH.Tooltip.showAtXY(aj,N,L,s,G)}if(V&&$WH.Tooltip.logo){$WH.Tooltip.logo.style.display=(C?"block":"none")}}function p(ah,aj,ai){if(i==ah&&P==aj&&T==ai){ae(D.loading);var ag=u[ah][0];ag[aj].timer=setTimeout(function(){M.apply(this,[ah,aj,ai])},3850)}}function M(ah,aj,ai){var ag=u[ah][0];ag[aj].status[ai]=l;if(i==ah&&P==aj&&T==ai){ae(D.noresponse)}}function h(ah,ag){return ah+(ag.rand?"r"+ag.rand:"")+(ag.ench?"e"+ag.ench:"")+(ag.gems?"g"+ag.gems.join(","):"")+(ag.sock?"s":"")}this.register=function(ai,ak,aj,ah){var ag=u[ai][0];o(ai,ak,aj);if(ag[ak].timer){clearTimeout(ag[ak].timer);ag[ak].timer=null}$WH.cO(ag[ak],ah);if(ag[ak].status[aj]==Q){if(ag[ak][X(aj)]){ag[ak].status[aj]=R}else{ag[ak].status[aj]=w}}if(i==ai&&ak==P&&T==aj){ae(ag[ak][X(aj)],ag[ak].icon)}};this.registerNpc=function(ai,ah,ag){this.register(x,ai,ah,ag)};this.registerObject=function(ai,ah,ag){this.register(n,ai,ah,ag)};this.registerItem=function(ai,ah,ag){this.register(E,ai,ah,ag)};this.registerQuest=function(ai,ah,ag){this.register(J,ai,ah,ag)};this.registerSpell=function(ai,ah,ag){this.register(y,ai,ah,ag)};this.registerAchievement=function(ai,ah,ag){this.register(q,ai,ah,ag)};this.registerProfile=function(ai,ah,ag){this.register(m,ai,ah,ag)};this.request=function(ag,ak,ai,aj){if(!aj){aj={}}var ah=h(ak,aj);o(ag,ah,ai);d(ag,ak,ai,1,aj)};this.requestItem=function(ah,ag){this.request(E,ah,b.getId(),ag)};this.requestSpell=function(ag){this.request(y,ag,b.getId())};this.getStatus=function(ah,aj,ai){var ag=u[ah][0];if(ag[aj]!=null){return ag[aj].status[ai]}else{return S}};this.getItemStatus=function(ah,ag){this.getStatus(E,ah,ag)};this.getSpellStatus=function(ah,ag){this.getStatus(y,ah,ag)};if(V){this.set=function(ag){$WH.cO(z,ag)};this.showTooltip=function(ai,ag,ah){r(ai);ae(ag,ah)};this.hideTooltip=function(){$WH.Tooltip.hide()};this.moveTooltip=function(ag){a(ag)}}aa()}};
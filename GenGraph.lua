JSON = require("json")
local widget = require("widget")
filename = ""
tempp = ""
function setname(name)
	tostring(name)
	filename=name

end

function getname()
	return filename
end

function saveGraph(event)
	if not(event.isError)then
		GraphImage = display.newImage(filename..".PNG",system.TemporaryDirectory)
		GraphImage.x = GraphImage.width/4
		GraphImage.y = GraphImage.height/2
		GraphImage:scale(0.5,0.7)
		scrollView = widget.newScrollView(
		{
			top = 50,
			lelf = 0,
			width = display.contentWidth,
			height = 300,
			scrollWidth = GraphImage.width/4,
			scrollHeight = GraphImage.height,
			listener = scrollEvent
			}
		)
		scrollView:insert(GraphImage)
		print("saved")
		
	else
		print("Erorr saveGraph")
	end
end

--------------------------------------------------------------------
function sendparam(event)
setname(math.random(0,500))
	if not(event.isError) then
			resp = JSON.decode(event.response)
			if(tempp=="") then
			tempp=tostring(resp["main"]["temp"])
			else
			tempp=tempp..","..tostring(resp["main"]["temp"])
			end
		url="https://chart.googleapis.com/chart?chxt=x,y&chxr=1,10,50&cht=lc&&chs=1000x300&chd=t:"..tempp.."&chds=0,50&chl=Bangkok|Phuket|ChiangMai|Songkhla|Krabi|UbonRatchathani&chm=s,000000,0,-1,5"
		print(url)
		network.download(url,"GET",saveGraph,getname()..".png",system.TemporaryDirectory)
		
	else
		print("Erorr1")
	end

end
--------------------------------------------------------------------
function requestWheather()
	provice = {1609350,1151254,1153671,1606147,1152633,1605245}
	for i=1,6 do
	URL="http://openweathermap.org/data/2.5/weather?id="..provice[i].."&appid=b1b15e88fa797225412429c1c50c122a1"
	
	network.request(URL,"GET",sendparam)
end
end
--------------------------------------------------------------------
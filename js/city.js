/**
* Philippine Provinces & Cities/Municipalities on HTML Dropdown
*
* @ version 1.0.0
* @ author Marvic R. Macalintal
*/
 var cities = {
	'Arusha'  : [
		'Arusha','Arumeru','Ngorongoro','Longido','Mondule','Karatu',
		'Arusha jiji','Arusha Dc','Meru DC','Ngorongoro Dc','Longido DC','Monduli DC',
		'Karatu Dc'
		],
	'Dar es salaam' : [
		'Kinondoni','ilala','Temeke','Kigamboni','Ubungu','Kinondoni Mc',
		'Dar es salaam Jiji','Ilala Mc','Temeke Mc','Kigamboni Mc','Ubungo Mc'
		],
	'Dodoma' : [
		'Chamwino','Dodoma','chemba','Kondoa','Bahi','Mpwapwa',
		'Kongwa','Chamwino Dc','Dodoma Jiji','Chemba Dc','Kondoa Dc',
		'Kondoa Mji','Bahi Dc','Mpwapwa Dc'
		],
	'Geita' : [
		'Bukombe','Mbogwe','Nyangwale','geita','chato','Bukombe Dc',
		'Bukombe Dc','Mbogwe Dc','Geita Dc','Chato Dc','Geita Mji'
		],
	'Iringa' : [
		'Mufindi','Kilolo','Iringa','Mufindi DC','Mafinga mji','Kilolo DC',
		'Iringa DC','Iringa MC'
		],
	'Kagera' : [
		'biharamulo','karagwe','Muleba','Kyerwa','Bukoba','Ngara Dc',
		'Missenyi'
		],
	'Katavi' : [
		'Mlele','Mpanda','Tanganyika','Kigoma','Mpimbwe Dc','Nsimbo Dc', 'kagera'
		],
	'Kigoma' : [
		'Kigoma','Kasulu','kakonko','uvinza','Buhigwe','Kibondo'
		],
	'Kilimanjaro' : [
		'Siha','Moshi','Mwanga','Rombo','Hai','Same'
		],
	'Lindi' : [
		'Nachingwea','Ruangwa','Liwale','kilwa'
		],
	'Manyara' : [
		'Babati','Mbulu','Hanang','kiteto','Simanjiro'
		],
	'Mara' : [
		'Rorya','Serengeti','Bunda','Butiama','Tarime','Musoma'
		],
	'Mbeya' : [
		'Chunya','Mbeya','Rungwe','Mbarali','Kyela','Busokelo Dc'
		],
	'Morogoro' : [
		'Gairo','Kilombero','Mvomero','Morogoro','Ulanga','Kilosa',
		'Malinyi'
		],
	'Mtwara' : [
		'Newala','Nanyumbu','Mtwara','Masasi','Tandahimba','Carmen'
		],	
	'Mwanza' : [
		'Ilemela','Kwimba','Sengerema','Nyamagana','Magu','Ukerewe',
		'Misungwi','Buchosa'
		],
	'Njombe' : [
		'Njombe','Ludewa','wangingombe','makete','Makambako Mji'
		],
	'Pwani' : [
		'Bagamoyo','Mkuranga','Rufiji','Mafia','Kibaha','Kisarawe',
		'chalinze','kibiti'
		],	
	'Rukwa' : [
		'Sumbawanga','Nkasi','Kalambo'
		],
	'Ruvuma' : [
		'Namtumbo','Mbinga','Nyasa','Tunduru','Songea','Madaba'
		],
	'Shinyanga' : [
		'Shinyanga','Kahama','Kishapu','Ushetu Dc','Msalala Dc'
		],
	'Simiyu' : [
		'Busega','Maswa','Bariadi','Meatu','Itilima'
		],
	'Singinda' : [
		'Mkalama','Manyoni','Singida','Ikungi','Iramba','itigi'
		],
	'Songwe' : [
		'Songwe','Ileje','Mbozi','Momba','Tunduma Mji'
		],
	'Tabora' : [
		'Nzega','Kaliua','igunga','sikonge','tabora','uyui'
		],
	'Tanga' : [
		'Tanga','Muheza','Mkinga','Pangani','Korogwe','Kilindi',
		'Lushoto', 'Bumbuli Dc'
		],
				
 }

 var City = function() {

	this.p = [],this.c = [],this.a = [],this.e = {};
	window.onerror = function() { return true; }
	
	this.getProvinces = function() {
		for(let province in cities) {
			this.p.push(province);
		}
		return this.p;
	}
	this.getCities = function(province) {
		if(province.length==0) {
			console.error('Please input province name');
			return;
		}
		for(let i=0;i<=cities[province].length-1;i++) {
			this.c.push(cities[province][i]);
		}
		return this.c;
	}
	this.getAllCities = function() {
		for(let i in cities) {
			for(let j=0;j<=cities[i].length-1;j++) {
				this.a.push(cities[i][j]);
			}
		}
		this.a.sort();
		return this.a;
	}
	this.showProvinces = function(element) {
		var str = '<option selected disabled>Select Province</option>';
		for(let i in this.getProvinces()) {
			str+='<option>'+this.p[i]+'</option>';
		}
		this.p = [];		
		document.querySelector(element).innerHTML = '';
		document.querySelector(element).innerHTML = str;
		this.e = element;
		return this;
	}
	this.showCities = function(province,element) {
		var str = '<option selected disabled>Select City / Municipality</option>';
		var elem = '';
		if((province.indexOf(".")!==-1 || province.indexOf("#")!==-1)) {
			elem = province;
		}
		else {
			for(let i in this.getCities(province)) {
				str+='<option>'+this.c[i]+'</option>';
			}
			elem = element;
		}
		this.c = [];
		document.querySelector(elem).innerHTML = '';
		document.querySelector(elem).innerHTML = str;
		document.querySelector(this.e).onchange = function() {		
			var Obj = new City();
			Obj.showCities(this.value,elem);
		}
		return this;
	}
}

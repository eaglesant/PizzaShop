

function button()
{
	var x = window.localStorage.getItem('bb');
	x = x * 1 + 1
	window.localStorage.setItem('bb', x);

	alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	return x;
}
function del_from_cart(id)
{
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 - 1;
	if (x<0) {return x = 0;}
	window.localStorage.setItem(key, x);
	return x;
}
function get_number_of_itemsCart()
{
	var cnt = 0;
	for(var i=0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);
		
		if (key.indexOf('product_') == 0)
		{
			cnt = cnt * 1 + value * 1;
		}
	}
	return cnt;
}
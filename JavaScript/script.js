function add_to_cart(pid, pname, price, availableQuantity) {
    // Convert availableQuantity from string to integer
    availableQuantity = parseInt(availableQuantity, 10);

    if (isNaN(availableQuantity)) {
        alert("Invalid available quantity.");
        return;
    }

    let cart = localStorage.getItem("cart");
    let isCartInitiallyEmpty = (cart == null);

    if (isCartInitiallyEmpty) {
        if (availableQuantity < 1) {
            alert("The quantity you want to purchase exceeds the available stock.");
            return;
        }
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price, availableQuantity: availableQuantity};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products)); // Store array of products
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);
        if (oldProduct) {
            // Check if the new total quantity does not exceed available quantity
            if (oldProduct.productQuantity + 1 > availableQuantity) {
                alert("The quantity you want to purchase exceeds the available stock.");
                return;
            } else {
                // Increase the quantity
                oldProduct.productQuantity += 1;
                pcart = pcart.map((item) => {
                    if (item.productId == oldProduct.productId) {
                        item.productQuantity = oldProduct.productQuantity;
                    }
                    return item;
                });
                localStorage.setItem("cart", JSON.stringify(pcart));
            }
        } else {
            if (availableQuantity < 1) {
                alert("The quantity you want to purchase exceeds the available stock.");
                return;
            }
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price, availableQuantity: availableQuantity};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
        }
    }
    update_cart();

    if (isCartInitiallyEmpty) {
        location.reload();
    }
}

function update_cart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty");
        $(".cart-items").html(" ( 0 ) Cart");
        $(".cart-body").html("<h3>Cart Does Not Have Any Product</h3>");
        $(".checkout-btn").addClass('disabled').prop('disabled', true); // Disable the checkout button
    } else {
        $(".cart-items").html(`( ${cart.length} ) Cart`);
        let table = `
             <table class='table'>
             <thead class='thead-light'>
               <tr>
               <th>Item Name</th>
               <th>Price</th>
               <th>Quantity</th>
               <th>Total Price</th>
               <th>Action</th>
               </tr>
             </thead>     
        `;
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                     <tr>
                        <td> ${item.productName} </td>
                        <td> &#8377;${item.productPrice} </td>
                        <td>
                            <button onclick='decrease_quantity(${item.productId})' class='btn-warning btn-sm'> - </button>
                            ${item.productQuantity}
                            <button onclick='increase_quantity(${item.productId}, ${item.availableQuantity})' class='btn-success btn-sm'> + </button>
                        </td>
                        <td> &#8377;${item.productQuantity * item.productPrice} </td> 
                        <td><button onclick='delete_item_from_cart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
                     </tr> 
            `;
            totalPrice += item.productPrice * item.productQuantity;
        });
        table = table + `<tr><td colspan='5' class='font-weight-bold' > Total Price : &#8377;${totalPrice} </tr></td></table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").removeClass('disabled').prop('disabled', false); // Enable the checkout button
    }
}


function delete_item_from_cart(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newcart = cart.filter((item) => item.productId != pid);
    localStorage.setItem("cart", JSON.stringify(newcart));
    update_cart();
}

function increase_quantity(pid, availableQuantity) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let product = cart.find((item) => item.productId == pid);
    if (product.productQuantity + 1 > availableQuantity) {
        alert("The quantity you want to purchase exceeds the available stock.");
        return;
    }
    product.productQuantity += 1;
    localStorage.setItem("cart", JSON.stringify(cart));
    update_cart();
}

function decrease_quantity(pid) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let product = cart.find((item) => item.productId == pid);
    if (product.productQuantity > 1) {
        product.productQuantity -= 1;
    } else {
        cart = cart.filter((item) => item.productId != pid);
    }
    localStorage.setItem("cart", JSON.stringify(cart));
    update_cart();
}


function gotocheckout()
{
    window.location = "checkout.jsp";
}

$(document).ready(function () {
    update_cart();
});

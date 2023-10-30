<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang Nạp Tiền</title>
<link rel="stylesheet" href="">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.content-box-sm {
	height: 100%;
	padding: 15px 30px 15px 30px;
	background-color: rgba(17,17,17,.67);
	box-sizing: border-box;
	display: block;
}

.content-box {
	padding: 85px 100px 130px 100px;
	box-sizing: border-box;
	display: flex;
	
	
}

.info {
	flex-grow: 1;
	margin-bottom: 30px;
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.detail-col-left {

}

body {
	color: #010101;
	font-size: 1rem;
	font-family: "Roboto Condensed", sans-serif;
}

.form-group {
	margin-bottom: 15px;
	display: block;
}

.form-control {
	display: block;
    padding: 6px 12px;
    line-height: 1.42857143;
    background-image: none;
    border: 1px solid #ccc;
    background-color: #eee;
    opacity: 1;
    font-size: 18px;
}

input {
	font-family: inherit;
	margin: 0;
	overflow: visible;
	width: 100%;
    box-sizing: border-box;
}

input[type="text" i] {
    writing-mode: horizontal-tb !important;
}

#btn-nophi, input {
	font-size: 18px;
    font-weight: 700;
    text-align: left;
    position: relative;
    color: black;
}

#btn-nophi: hover {
	border-color: #F00;
    color: #f00;
}

.detail-col .form-control {
    height: 37px!important;
    box-shadow: none !important;
    border-radius: 3px !important;
}

.list-unstyled {
	display: flex;
    justify-content: space-around;
    padding: 0;
}

#btn-pay{
    text-transform: uppercase;
    background-color: #0066b3!important;
    border-color: #0066b3!important;
    transition: all 0.3s ease-in;
    color: #fff;
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
}

.Contain-btnPay {
	display: flex;
    justify-content: space-between;
}

.Contain-btnPay {
	width: 50%;
}

img {
	background: white;
}

#banks ul li {
	margin-left: 15px;
	margin-lright: 15px;
	display: block;
    height: 58px;
    width: 95px;
    line-height: 58px;
    text-align: center;
    color: #337ab7;
    text-decoration: none;
}


</style>

</head>
<body>
	<section id="page-content">
         <div class="content-box">
             <div class="info">
                 <div class="content-box-sm">
                     <div id="detail-col-left" class="detail-col">
                         <h2>Thông tin nạp tiền</h2>

                         <div class="form-group">
                             <label for="masv">Mã học viên</label>
                             <input type="text" class="form-control" id="masv" value="LuanNgao" readonly="readonly" fdprocessedid="t0z1ug">
                         </div>

                         <div class="form-group">
                             <label for="hoten">Họ và tên học viên</label>
                             <input type="text" class="form-control" id="hoten" value="Luân like thịt chó" readonly="readonly" fdprocessedid="3rtu6e">
                         </div>
                         
                         <div class="form-group">
                             <label for="hoten">Mã thẻ</label>
                             <input type="text" class="form-control" id="hoten" value="Thẻ đỏ" readonly="readonly" fdprocessedid="3rtu6e">
                         </div>

                         <div class="form-group">
                             <label for="btn-nophi">Số tiền cần nạp</label>
                             <a id="btn-nophi" href="" role="button" class="btn form-control" data-toggle="modal" data-target="#debtsModal"><span id="totalAmount">500</span>USD<span></span></a>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="info">
                 <div class="content-box-sm">
                     <div id="detail-col-right" class="detail-col">
                         <h2>Chọn hình thức thanh toán</h2>
                         <div class="row">
                             <div class="col-xs-12">
                                 <div id="banks">
                                     <input type="hidden" name="payment-provider-list" value="0">
                                     <ul id="payment-provider-list" class="list-unstyled">
                                            <li class="">
                                                <a title=" VnPay Vietcombank" href="javascript:void(0)" class="li-bank" data-provider-code="VnPay" data-invoice-type="Online" data-payment-method-id="157" data-pay-by-qr="False" onclick="paymentProviderAction(&#39;VnPay&#39;)">
                                                    <img src="https://e-bills.vn/assets/img/VCB.png" height="74" width="120">
                                                </a>
                                            </li>
                                            <li class="">
                                                <a title="BIDV" href="javascript:void(0)" class="li-bank" data-provider-code="BIDV" data-invoice-type="Online" data-payment-method-id="96" data-pay-by-qr="False" onclick="paymentProviderAction(&#39;BIDV&#39;)">
                                                    <img src="https://e-bills.vn/assets/img/BIDV.png" height="74" width="120">
                                                </a>
                                            </li>
                                            <li class="">
                                                <a title="ATM" href="javascript:void(0)" class="li-bank" data-provider-code="VnPay" data-invoice-type="Online" data-payment-method-id="127" data-pay-by-qr="False" onclick="paymentProviderAction(&#39;VnPay&#39;)">
                                                    <img src="https://s.luyengame.net/games/pikachu/image.jpg" height="74" width="120">
                                                </a>
                                            </li>
                                            <li class="">
                                                <a title="QR" href="javascript:void(0)" class="li-bank" data-provider-code="VnPay" data-invoice-type="Online" data-payment-method-id="168" data-pay-by-qr="False" onclick="paymentProviderAction(&#39;VnPay&#39;)">
                                                    <img src="https://s.luyengame.net/games/pikachu/image.jpg" height="74" width="120">
                                                </a>
                                            </li>
                                     </ul>
                                 </div>
                                 <div id="pgNote"></div>
                             </div>
                         </div>
                         <div class="row">
                         	<div class="Contain-btnPay">
                             	<div class="form-group">
                             	</div>
                            </div>
                            <div class="Contain-btnPay">
                             	<div class="form-group">
                             		<a id="btn-pay" href="" role="button" class="btn btn-primary form-control">Nạp Tiền</a>
                             	</div>
                            </div>
                         </div>
                     </div>              
         	    </div>
         	</div>                        
        </section>
</body>
<footer>
</footer>
</html>
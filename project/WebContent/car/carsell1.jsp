<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top1.jsp" />

<style>
	.option {
		position: relative;
	}
	
	.circle_2 {
		position: absolute;
		top: 12px;
		left: 4px;
		 width: 13px;
      height: 13px;
      display:inline-block;
      border: 1px solid #999;
      border-radius:50%;
	}
	
    section:before {
        content: '';
        display: block;
        width: 100%;
        height: 1px;
        background: #ededed;
        margin-bottom: 1%;
    }


    .bWrap_header {
        width: 100%;
    }

    .bWrap_header>ul {

        width: 100%;
        height: 100%;
    }

    .bWrap_header>ul>li {
        width: 20%;
        float: left;
        text-align: center;
        padding: 2%;
        box-sizing: border-box;
        font-weight: bold;
        border-bottom: 1px solid rgb(168, 168, 168);
        margin-bottom: 50px;
    }

    .bWrap_header>ul>li.selected_header {
        border-bottom: 3px solid #e66b27;
        color: #e66b27;
        font-weight: bold;
        padding-bottom: calc(2% - 2px);
    }

    .board>form>div {
        display: none;
    }

    .board_active {
        display: contents !important;
    }


    /* car info */
    .board_tit {
        margin-bottom: 8px;
        font-size: 18px;
        font-weight: bold;
    }

    input:active,
    input:focus,
    textarea:active,
    textarea:focus {
        outline: none !important;
        border: 1px solid #e66b27 !important;
    }

    input {
        box-sizing: border-box;
        padding: 12px 48px;
        border: 1px solid #ededed;
        margin-bottom: 8px;
        text-align: right;
        font-size: 16px;
        height: 40px;
    }

    textarea {
        box-sizing: border-box;
        padding: 12px 36px;
        border: 1px solid #ededed;
        margin-bottom: 8px;
        font-size: 16px;
    }

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input::placeholder {
        color: #999;
        text-align: right;
        font-size: 14px;
    }

    .input_box {
        position: relative;
    }

    .input_tit {
        position: absolute;
        top: 12px;
        left: 24px;
        font-size: 16px;
    }

    .select-box {
        display: flex;
        width: 100%;
        flex-direction: column;
    }

    .select-box .options-container {
        border: 1px solid #e66b27;
        max-height: 0;
        width: 100%;
        opacity: 0;
        transition: all 0.4s;
        overflow: hidden;

        order: 1;
    }

    .selected {
        border: 1px solid #ededed;
        margin-bottom: 8px;
        position: relative;

        order: 0;
    }

    .selected::after {
        content: "";
        background: url("images/arrow-down2.svg");
        background-size: contain;
        background-repeat: no-repeat;

        position: absolute;
        height: 100%;
        width: 32px;
        right: 10px;
        top: 5px;
        transition: all 0.4s;
    }

    .select-box .options-container.active {
        max-height: 240px;
        opacity: 1;
        overflow-y: scroll;
    }

    .select-box .options-container.active+.selected::after {
        transform: rotateX(180deg);
        top: -6px;
    }

    .select-box .options-container::-webkit-scrollbar {
        width: 8px;
        background: #dadada;
    }

    .select-box .options-container::-webkit-scrollbar-thumb {
        background: #999;
        border-radius: 3px;
    }

    .select-box .option,
    .selected {
        padding: 12px 24px;
        cursor: pointer;
    }

    .select-box .option:hover {
        background: #ededed;
    }

    .select-box label {
        cursor: pointer;
    }

    .select-box .option .radio {
        display: none;
    }

    .btn_next,
    .btn_back,
    .btn {
        float: left;
        width: 49.5%;
        padding: 12px;
        font-size: 16px;
        box-sizing: border-box;
        margin-top: 24px;
    }

    .btn_first {
        margin-left: 25.25%;
    }

    button:active,
    button:focus {
        border: none;
        outline: none;
    }

    .btn_next,
    .btn {
        border: none;
        background: #e66b27;
        border: 1px solid #e66b27;
        color: #fff;
    }

    .btn_back {
        border: 1px solid #e66b27;
        background: none;
        color: #e66b27;
        margin-right: 1%;
    }

    /* option */
    .option_checkBox {
        width: 100%;
        position: relative;
        padding: 12px 24px;
        box-sizing: border-box;
        float: left;
    }

    input[type="checkbox"] {
        border: none;
        margin: 0;
        appearance: checkbox;
        width: 16px;
        height: 16px;
    }

    .option_label {
        position: absolute;
        top: 12px;
        font-size: 16px;
        left: 52px;
    }

    .option_wrap {
        border: 1px solid #ededed;
        padding: 12px 24px;
        box-sizing: border-box;
    }

    .small {
        font-size: 0.8em;
    }

    .ddd {
        background: #ededed;
        margin: 8px 0;
        width: 100%;
    }

    .hot {
        background: #e66b27;
        color: #fff;
        border-radius: 4px;
        padding: 0 2px;
    }

    .payprice {
        float: right;
    }

    input[type="file"] {
        box-sizing: border-box;
        width: 100%;
        padding: 8px 0;
        border: 1px solid #ededed;
        margin-bottom: 8px;
        text-align: right;
        font-size: 16px;
        height: 40px;
    }

    input[type="file"]::-webkit-file-upload-button {
        height: 1px;
        padding: 0;
        margin: -1px -200px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        border: 0;
        width: 200px;
        box-sizing: border-box;
    }

    .selected_one {
        float: right;
        padding-right: 24px;
        text-align: right;
    }

    input[name="price"]::placeholder {
        text-align: left !important;
    }

    @media all and (min-width:768px) {
        .option_checkBox {
            width: 50%;
        }

        .btn_group {
            max-width: 768px;
            margin: 0 auto;
        }

    }

    @media all and (min-width:1132px) {
        .option_checkBox {
            width: 25%;
        }
    }
</style>

<script>

// ????????? - ????????? - ?????? - ???????????? ?????? ??????

	$(function(){
		$('#detail-container .option').on('click', function(){
			var con = $(this).children('input').val()
			//alert(con);
				$.ajax({
					type:'get',
					url:'../brandSearch.do?country='+con,
					dataType:'html',
					cache:false,
					success:function(res) {
						$('#company-container').html(res);
					},
					error:function(err) {
						alert('error: '+err.statys);
					}
				})
		})
		
		$(document).on('click', '#company-container .option', function(){
			var model = $(this).children('input').val()
				$.ajax({
					type:'get',
					url:'../modelSearch.do?model='+model,
					dataType:'html',
					cache:false,
					success:function(res) {
						$('#model-container').html(res);
						
					},
					error:function(err) {
						alert('error: '+err.status);
					}
				})
		})
		
		$(document).on('click', '#model-container .option', function(){
			var dmodel = $(this).children('input').val()
				$.ajax({
					type:'get',
					url:'../detailModelSearch.do?dmodel='+dmodel,
					dataType:'html',
					cache:false,
					success:function(res) {
						$('.select-box #detail-container').html(res);
					
					},
					error:function(err) {
						alert('error: '+err.status);
					}
				})
	
		})
	})
	
// ??????????????? ????????? ????????? ?????? ??????
	
	// ???????????? ????????? ?????? (??????: 00???0000 , 000???0000)
	function isCarNum(obj) {
		var val = obj.value;
		var pattern = new RegExp(/^[0-9]{2,3}[???-???]{1}[0-9]{4}$/);
		var b = pattern.test(val); 
		return b;
	}

	// ?????? ?????? ????????? ?????? (??????: 0000.00)
	function isDate(obj) {
		var val = obj.value;
		var pattern = new RegExp(/^[0-9]{4}[.][0-9]{1,2}$/);
		var b = pattern.test(val);
		return b;
	}
	
	// ?????? ????????? ????????? ?????? (??????: 0000)
	function isCc(obj) {
		var val = obj.value;
		var pattern = new RegExp(/^[0-9]{4}$/);
		var b = pattern.test(val);
		return b;
	}

	// ?????? ???????????? ????????? ?????? (?????? : 000000)
	function isKm(obj) {
		var val = obj.value;
		var pattern = new RegExp(/^[0-9]{1,6}$/);
		var b = pattern.test(val);
		return b;
	}
	
</script>

<section>
    <div class="bWrap container">
        <div class="bWrap_header cfixed">
            <ul>
                <li id="header_car_info" class="selected_header">????????????</li>
                <li id="header_car_option">??????</li>
                <li id="header_car_explain">?????????</li>
                <li id="header_car_picture">??????</li>
                <li id="header_car_payment">??????</li>
            </ul>
        </div>
        <div class="board">
            <form action="carSellEnd.do" name="carF" method="post" enctype="multipart/form-data">



                <!-- ???????????? -->

                <div class="car_info board_active select_board">
                    <h1 class="board_tit">??????????????? ???????????????</h1>

                    <div class="input_box">
                        <p class="input_tit">????????????</p>
                        <input type="text" name="carNum" id="carNum" maxlength="8" minlength="7" placeholder="???) 000???0000">
                        <div style="float:left;"><label id="carN"></label></div>
                    </div>
                    
                      <!-- ?????? -->
                        <div class="select-box">
                            <div class="options-container">
                           		<div class="option">
                                    <input type="radio" name="carKind" class="radio" value="??????">
                                    <label>??????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="?????????">
                                    <label>?????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="????????????">
                                    <label>????????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="?????????">
                                    <label>?????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="?????????">
                                    <label>?????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="????????????">
                                    <label>????????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="SUV">
                                    <label>SUV</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="RV">
                                    <label>RV</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="????????????">
                                    <label>????????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="?????????">
                                    <label>?????????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="??????">
                                    <label>??????</label>
                                </div>
                                <div class="option">
                                    <input type="radio" name="carKind" class="radio" value="??????">
                                    <label>??????</label>
                                </div>
                            </div>
							
                            <div class="selected" >
                                ??????
                                <span class="selected_one" id="carS" ></span>
                            </div>
                            <label id="carSl"></label>
                        </div>


                    <!-- ????????? -->
                    <div class="select-box">
                        <div class="options-container" id="detail-container">
                            <div class="option detail-option">
                                <input type="radio" name="country" class="radio" value="??????" checked>
                                <label>??????</label>
                            </div>

                            <div class="option">
                                <input type="radio" name="country" class="radio" value="??????">
                                <label>??????</label>
                            </div>
                        </div>

                        <div class="selected" id="detail-name">
                            ?????????
                            <span class="selected_one" id="countryR"></span>
                        </div>
                        <label id="countryRl"></label>
                    </div>


                    <!-- ????????? -->
                    <div class="select-box">
                        <div class="options-container company-container" id="company-container">
      

                        </div>

                        <div class="selected" id="company-name">
                            ?????????
                            <span class="selected_one" id="companyR"></span>
                        </div>
                        <label id="companyRl"></label>
                    </div>

                    <!-- ????????? -->
                    <div class="select-box">
                        <div class="options-container model-container" id="model-container">                 

                        </div>

                        <div class="selected" id="model-name">
                            ??????
                            <span class="selected_one" id="modelR"></span>
                        </div>
                        <label id="modelRl"></label>
                    </div>

                    <!-- ???????????? -->
                    <div class="select-box">
                        <div class="options-container detail-container" id="detail-container">
                              
                        </div>

                        <div class="selected" id="detail-name2">
                            ?????? ??????
                            <span class="selected_one" id="smodelR"></span>
                        </div>
                        <label id="smodelRl"></label>
                    </div>

                    <!-- ?????? -->
                    <div class="select-box">
                        <div class="options-container">
                            <div class="option">
                                <input type="radio" name="fuel" class="radio" value="?????????">
                                <label>?????????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="fuel" class="radio" value="??????">
                                <label>??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="fuel" class="radio" value="LPG">
                                <label>LPG</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="fuel" class="radio" value="?????????+LPG">
                                <label>?????????+LPG</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="fuel" class="radio" value="?????????+??????">
                                <label>?????????+??????</label>
                            </div>

                        </div>

                        <div class="selected">
                            ??????
                            <span class="selected_one" id="fuelR"></span>
                        </div>
                        <label id="fuelRl"></label>
                    </div>

                    <div class="input_box">
                        <p class="input_tit">??????(???????????????)</p>
                        <input type="text" name="date" id="date" placeholder="???) 2020.03">
                        <label class="text-right" id="carD"></label>
                    </div>

                    <div class="input_box">
                        <p class="input_tit">?????????</p>
                        <input type="number" name="cc" id="cc" placeholder="???) 800cc">
                        <label class="text-right" id="carC"></label>
                    </div>
                    
                    <!-- ?????? -->
                    <div class="select-box">
                        <div class="options-container">
                            <div class="option">
                                <input type="radio" name="seater" class="radio" value="4??????">
                                <label>4??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="seater" class="radio" value="5??????">
                                <label>5??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="seater" class="radio" value="7??????">
                                <label>7??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="seater" class="radio" value="11??????">
                                <label>11??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="seater" class="radio" value="15??????">
                                <label>15??????</label>
                            </div>
                        </div>

                        <div class="selected">
                         	??????
                            <span class="selected_one" id="seaterR"></span>
                        </div>
                        <label id="seaterRl"></label>
                    </div>

                    <!-- ????????? -->
                    <div class="select-box">
                        <div class="options-container">
                            <div class="option">
                                <input type="radio" name="gear" class="radio" value="??????">
                                <label>??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="gear" class="radio" value="??????">
                                <label>??????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="gear" class="radio" value="????????????">
                                <label>????????????</label>
                            </div>
                            <div class="option">
                                <input type="radio" name="gear" class="radio" value="CVT">
                                <label>CVT</label>
                            </div>
                        </div>

                        <div class="selected">
                           	 ?????????
                            <span class="selected_one" id="gearR"></span>
                        </div>
                        <label id="gearRl"></label>
                    </div>

                    <!-- ?????? -->
                    <div class="select-box">
                        <div class="options-container">
                        	<div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: #fff;">       
                      		    </div>
                            </div>
                        
                        	<div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:ivory">       
                      		    </div>
                            </div>
                                        
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:black">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="????????????">
                                <label>????????????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgba(17,17,17,1) 0%, rgba(17,17,17,1) 49%, rgba(119,119,119,1) 50%, rgba(119,119,119,1) 100%);">       
                      		    </div>
                            </div>
                    
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background:gray">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background:silver">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="????????????">
                                <label>????????????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgba(194,194,194,1) 0%, rgba(194,194,194,1) 49%, rgba(119,119,119,1) 50%, rgba(119,119,119,1) 100%);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="????????????">
                                <label>????????????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgba(194,194,194,1) 0%, rgba(194,194,194,1) 49%, rgba(255,255,255,1) 50%, rgba(255,255,255,1) 100%);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:rgb(189,184,178)">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:#A6B2B0;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:#D0D9E7;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:red;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:orange;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:#7D265B;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:purple;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:pink;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:yellow;">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background:rgb(128,129,116);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background: rgb(142,133,116);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgb(104,90,54) 0%, rgb(104,90,54) 49%, rgb(70,71,65) 50%, rgb(70,71,65) 100%);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="????????????">
                                <label>????????????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgb(104,90,54) 0%, rgb(104,90,54) 49%, rgb(70,71,65) 50%, rgb(70,71,65) 100%);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgb(130,116,56) 0%, rgb(130,116,56) 49%, rgb(70,71,65) 50%, rgb(70,71,65) 100%);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="????????????">
                                <label>????????????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, rgb(130,116,56) 0%, rgb(130,116,56) 49%, rgb(70,71,65) 50%, rgb(70,71,65) 100%);">                    
                      		    </div>
                            </div>
                            
                             <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: rgb(18,66,127);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background: rgb(117,145,156);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background: rgb(30,68,75);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: rgb(46,205,0);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background: rgb(154,185,92);">       
                      		    </div>
                            </div>
                            
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="?????????">
                                <label>?????????</label>
                                <div class="circle_2" style="background: rgb(31,125,124);">       
                      		    </div>
                            </div>
                           
                            <div class="option">
                                <input type="radio" name="color" class="radio" value="??????">
                                <label>??????</label>
                                <div class="circle_2" style="background: linear-gradient(90deg, red 14%, orange 28%, yellow 42%, green 56%, blue 70%, navy 84%,  purple 100%);">       
                      		    </div>
                            </div>
                        </div>

                        <div class="selected">
                           	 ??????
                            <span class="selected_one" id="colorR"></span>
                        </div>
                        <label id="colorRl"></label>
                    </div>

                    <div class="input_box">
                        <p class="input_tit">????????????</p>
                        <input type="number" name="km" id="km" placeholder="???) 100km">
                        <label id="carK"></label>
                    </div>

                    <div class="btn_group">
                        <button type="button" id="car_info_btn" class="btn_next btn_first" >??????(????????????)</button>
                    </div>
                </div>


                <!-- ?????? -->
                <div class="car_option select_board">
                    <h1 class="board_tit">????????? ???????????????</h1>

                    <div class="option_wrap cfixed" style="padding: 1%;">
                    
                    	<div style="font-size: 2em; margin: 2%;">??????/??????</div>
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="301" id="option1">
                            <label for="option1" class="option_label">?????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="302" id="option2">
                            <label for="option2" class="option_label">????????????(LED)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="303" id="option3">
                            <label for="option3" class="option_label">?????????????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="304" id="option4">
                            <label for="option4" class="option_label">????????? ?????? ?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="305" id="option5">
                            <label for="option5" class="option_label">???????????? ????????? ??????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="306" id="option6">
                            <label for="option6" class="option_label">???????????? ???</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="307" id="option7">
                            <label for="option7" class="option_label">?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="308" id="option8">
                            <label for="option8" class="option_label">?????? ???????????? ???</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="309" id="option9">
                            <label for="option9" class="option_label">?????? ?????? ???????????? ???</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="310" id="option10">
                            <label for="option10" class="option_label">?????? ?????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="311" id="option11">
                            <label for="option11" class="option_label">???????????? ??? ?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="312" id="option12">
                            <label for="option12" class="option_label">ECM ?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="313" id="option13">
                            <label for="option13" class="option_label">????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="314" id="option14">
                            <label for="option14" class="option_label">?????? ?????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="315" id="option15">
                            <label for="option15" class="option_label">?????????????????? ???</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="316" id="option16">
                            <label for="option16" class="option_label">???????????????</label>
                        </div>
                        
                        <br>
                    	
                    	<!-- ---------------------------------------------------------------------- -->
                    	
                    	<div style="font-size: 2em; margin: 2%; margin-top:15%;">??????</div>
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="101" id="option17">
                            <label for="option17" class="option_label">?????????(?????????, ?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="102" id="option18">
                            <label for="option18" class="option_label">?????????(?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="103" id="option19">
                            <label for="option19" class="option_label">?????????(??????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="104" id="option20">
                            <label for="option20" class="option_label">???????????? ?????? ??????(ABS)</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="105" id="option21">
                            <label for="option21" class="option_label">????????? ??????(TCS)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="106" id="option22">
                            <label for="option22" class="option_label">???????????? ????????????(ESC)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="107" id="option23">
                            <label for="option23" class="option_label">????????? ???????????????(TPMS)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="108" id="option24">
                            <label for="option24" class="option_label">???????????? ?????? ?????????(LDWS)</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="111" id="option25">
                            <label for="option25" class="option_label">???????????? ????????????(ECS)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="112" id="option26">
                            <label for="option26" class="option_label">??????????????????(??????,??????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="113" id="option27">
                            <label for="option27" class="option_label">????????? ?????? ?????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="114" id="option28">
                            <label for="option28" class="option_label">???????????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="115" id="option29">
                            <label for="option29" class="option_label">360??? ???????????????</label>
                        </div>
                        <br>
                        


                        
                        <!-- --------------------------------------------------------------------- -->
                        	
                    
                        
                        <div style="font-size: 2em; margin: 2%; margin-top:15%;">??????/???????????????</div>
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="401" id="option30">
                            <label for="option30" class="option_label">??????????????????(????????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="402" id="option31">
                            <label for="option31" class="option_label">????????? ???????????????(HUD)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="403" id="option32">
                            <label for="option32" class="option_label">????????? ??????????????????(EPB)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="404" id="option33">
                            <label for="option33" class="option_label">?????? ?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="405" id="option34">
                            <label for="option34" class="option_label">????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="406" id="option35">
                            <label for="option35" class="option_label">???????????? ????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="407" id="option36">
                            <label for="option36" class="option_label">????????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="408" id="option37">
                            <label for="option37" class="option_label">?????? ?????????</label>
                        </div>
                        
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="409" id="option38">
                            <label for="option38" class="option_label">??????/????????????(?????????, ??????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="410" id="option39">
                            <label for="option39" class="option_label">???????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="411" id="option40">
                            <label for="option40" class="option_label">????????? AV ?????????</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="412" id="option41">
                            <label for="option41" class="option_label">????????? AV ?????????</label>
                        </div>
                        
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="413" id="option42">
                            <label for="option42" class="option_label">????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="414" id="option43">
                            <label for="option43" class="option_label">USB ??????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="415" id="option44">
                            <label for="option44" class="option_label">AUX ??????</label>
                        </div>
                        <br>
        <!-- ------------------------------------------------------------------------------------ -->                
                        
                        <div style="font-size: 2em; margin: 2%; margin-top:15%;">??????</div>
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="201" id="option45">
                            <label for="option45" class="option_label">????????????</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="202" id="option46">
                            <label for="option46" class="option_label">????????????(?????????, ?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="203" id="option47">
                            <label for="option47" class="option_label">????????????(?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="204" id="option48">
                            <label for="option48" class="option_label">????????????(?????????, ?????????)</label>
                        </div>
                        
                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="205" id="option49">
                            <label for="option49" class="option_label">???????????????(?????????, ?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="206" id="option50">
                            <label for="option50" class="option_label">????????????(?????????, ?????????)</label>
                        </div>

                        <div class="option_checkBox">
                            <input type="checkbox" name="opt1" value="207" id="option51">
                            <label for="option51" class="option_label">????????????(?????????)</label>
                        </div>

                    </div>
                    <div class="btn_group">
                        <button type="button" class="btn btn_back">??????</button>
                        <button type="button" class="btn btn_next">??????(?????????)</button>
                    </div>
                </div>

                <!-- ?????? -->
                <div class="car_explain select_board">
                    <h1 class="board_tit">??????????????? ????????? ??????????????????</h1>

                    <div class="input_box">
                        <p class="input_tit">????????????</p>
                        <input type="number" name="carPrice" id="carPrice" placeholder="1,000,000"
                            style="text-align: left !important;padding-left: 210px !important;">
                        <label id="carPriceL"></label>
                    </div>

                    <div class="input_box">
                        <p class="input_tit">???????????? ?????????</p>
                        <input type="file" name="carTest_Img" id="catTest">
                        <label id="catTestL"></label>
                    </div>

                    <div class="input_box">
                        <textarea name="introd" id="introdC" cols="30" rows="30"></textarea>
                         <label id="introdCl"></label>
                    </div>

                    <div class="btn_group">
                        <button type="button" class="btn btn_back">??????</button>
                        <button type="button" class="btn btn_next">??????(??????)</button>
                    </div>
                </div>

                <!-- ?????? -->
                <div class="car_picture select_board">
                    <h1 class="board_tit">??????????????? ????????? ????????????</h1>
                    <div class="input_box">
                        <p class="input_tit">????????? ??????</p>
                        <input type="file" name="car_Img1" class="upload_picture">
                    </div>

                    <div class="input_box">
                        <p class="input_tit">????????? ??????</p>
                        <input type="file" name="car_Img2" class="upload_picture">
                    </div>

                    <div class="input_box">
                        <p class="input_tit">?????? ?????? ??????</p>
                        <input type="file" name="car_Img3" class="upload_picture">
                    </div>

                  <!--   <div class="input_box">
                        <p class="input_tit">????????? ??????</p>
                        <input type="file" name="" class="upload_picture">
                    </div> -->

                    <div class="btn_group">
                        <button type="button" class="btn btn_back">??????</button>
                        <button type="button" class="btn btn_next">??????(??????)</button>
                    </div>
                </div>

                <!-- ?????? -->
                <div class="car_payment select_board">
                    <h1 class="board_tit">???????????? ??????</h1>
                    <div class="option_wrap">
                        <div class="payment_checkBox">
                            <input type="checkbox" checked disabled>
                            <label class="payname">????????????<span class="small"> + ?????????????????? 3???</span></label>
                            <label class="payprice"><span
                                    style="border: 1px solid #ededed; border-radius: 4px;">??????</span>
                                24,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o1" onclick="car()">
                            <label class="payname">???????????????<span class="small"> ????????? ????????? ????????? ???????????? ??????
                                    ??????</span> <span class="hot small">Hot</span></label>
                            <label class="payprice"> 5,000???</label>
                        </div>

                    </div>
                    <h3 style="color: gray; margin: 24px 0 8px">??? ?????? ??????, ???????????? ??????!</h3>
                    <div class="option_wrap">
                        <div class="payment_checkBox">
                            <input type="checkbox" name="o2" onclick="car()"> 
                            <label class="payname">?????????<span class="small"> ????????? ????????? 3???</span></label>
                            <label class="payprice">10,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o3" onclick="car()">
                            <label class="payname">?????? ????????????<span class="small"> ??? 12??? ???????????? ?????? ??????</span> <span
                                    class="hot small">Best</span></label>
                            <label class="payprice"> 30,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o4" onclick="car()">
                            <label class="payname">????????????<span class="small"> ????????? + ???????????? + ???????????? </span></label>
                            <label class="payprice"> 72,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o5" onclick="car()">
                            <label class="payname">????????????<span class="small">?????? + ??????2??? + ???????????? </span></label>
                            <label class="payprice"> 30,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o6" onclick="car()">
                            <label class="payname">????????? ????????????<span class="small"> ????????? ????????? + ???????????? 4???</span> <span
                                    class="hot small">Best</span></label>
                            <label class="payprice"> 100,000???</label>
                            <hr class="ddd">
                            <input type="checkbox" name="o7" onclick="car()">
                            <label class="payname">???????????????<span class="small"> ????????? ?????? ?????? ??????</span> <span
                                    class="hot small">Hot</span></label>
                            <label class="payprice"> 50,000???</label>
                        </div>

                    </div>
                         <input type="text" name="total" id="total" value="24000" readonly="readonly" />

                    <div class="btn_group">
                        <button type="button" class="btn btn_back">??????</button>
                        <button class="btn">??????</button>
                    </div>
                </div>





            </form>
        </div>
    </div>
</section>



<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

    $(function () {
    	// ???????????? ????????? ??????
    	$('#carNum').focus(function(){
    		$('#carN').html('????????? ????????? ?????? ????????? ?????????. \n ???) "00???0000", "000???0000"').css({
    			'color': 'red'		   	,
    			'margin-bottom':'8px','display':'block'	
    		});
    		carF.carNum.focus();
    	})
    	
    	
    	// ???????????? ????????? ?????? ??????
    	$('#carNum').focusout(function(){
	    		if(isCarNum(carF.carNum)) {
	    			$('#carN').html('????????? ?????? ?????????.').css({
	        			'color': 'green',
	        			'margin-bottom':'8px','display':'block'
	        		});
	    		}
    		})
    	
    	// ?????? ????????? ??????
    	$('#date').focus(function(){
    		$('#carD').html('????????? [0000.00] ????????? ?????? ?????????.').css({
    			'color': 'red'		   	,
    			'margin-bottom':'8px','display':'block'	
    		});
    	})
    	
    	$('#date').focusout(function(){
	    		if(isDate(carF.date)) {
	    			$('#carD').html('????????? ?????? ?????????.').css({
	        			'color': 'green',
	        			'margin-bottom':'8px','display':'block'  			
	        		});
	    		}
    		})
    		
    	// ????????? ????????? ??????
    	$('#cc').focus(function(){
    		$('#carC').html('????????? ???????????? 4?????? ????????? ????????? ?????????.').css({
    			'color': 'red'		   	,
    			'margin-bottom':'8px','display':'block'	
    		});
    	})
    	
    	$('#cc').focusout(function(){
	    		if(isCc(carF.cc)) {
	    			$('#carC').html('????????? ?????? ?????????.').css({
	        			'color': 'green',
	        			'margin-bottom':'8px','display':'block'			
	        		});
	    		}
    		})
    		
    	// ???????????? ????????? ??????
    	$('#km').focus(function(){
    		$('#carK').html('????????? ??????????????? 6?????? ????????? ????????? ????????? ?????????.').css({
    			'color': 'red'			   	,
    			'margin-bottom':'8px','display':'block'
    		});
    	})
    	
    	$('#km').focusout(function(){
	    		if(isKm(carF.km)) {
	    			$('#carK').html('????????? ?????? ?????????.').css({
	        			'color': 'green',
	        			'margin-bottom':'8px','display':'block'			
	        		});
	    		}
    		})
    		
    	// ?????? ???????????? ???????????? ????????? ??????.
    	$('#company-name').click(function(){
    		if(!$('#countryR').text()){
    			$('#countryRl').html('???????????? ?????? ????????? ?????????.').css('color', 'blue').css({'margin-bottom':'8px','display':'block'});
    		}
    	})

    	$('#model-name').click(function(){
    		if(!$('#companyR').text()){
    			$('#companyRl').html('???????????? ?????? ????????? ?????????.').css('color', 'blue').css({'margin-bottom':'8px','display':'block'});
    		}
    	})
    	
    	$('#detail-name2').click(function(){
    		if(!$('#modelR').text()){
    			$('#modelRl').html('????????? ?????? ????????? ?????????.').css('color', 'blue').css({'margin-bottom':'8px','display':'block'});
    		}
    	})
    	   
    	
    	// ????????? ??? ????????? ??????
        $('.btn_next').click(function(){    

			if($('#header_car_info').is('.selected_header')){
	        	if(!carF.carNum.value) {
	        		$('#carN').html('????????? ????????? ?????? ????????? ?????????. \n ???) "00???0000", "000???0000"').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	            	carF.carNum.focus();
	            } else if(!isCarNum(carF.carNum)) {
	        		$('#carL').html('????????? ????????? ?????? ????????? ?????????. \n ???) "00???0000", "000???0000"').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	        		carF.carNum.select();
	        	} else if(!$('#carS').text()) { 
	 				$('#carSl').html('????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#carSl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#countryR').text()) { 
	 				$('#countryRl').html('??????/?????? ????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});   
	 				var offset = $("#countryRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#companyR').text()) { 
	 				$('#companyRl').html('???????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#companyRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#modelR').text()) { 
	 				$('#modelRl').html('????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#modelRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#smodelR').text()) { 
	 				$('#smodelRl').html('?????? ????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#smodelRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#fuelR').text()) { 
	 				$('#fuelRl').html('????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#fuelRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!carF.date.value) {
	        		$('#carD').html('????????? [0000.00] ????????? ?????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	            	carF.date.focus();
	            } else if(!isDate(carF.date)){
	            	alert('????????? [0000.00] ????????? ?????? ?????????.');
	            	carF.date.select();
	            } else if(!carF.cc.value) {
	            	alert('????????? ???????????? ????????? ?????????.');
	            	carF.cc.focus();
	            } else if(!isCc(carF.cc)) { 
	            	alert('????????? ???????????? 4?????? ????????? ????????? ?????????.');
	            	carF.cc.select();
	        	} else if(!$('#seaterR').text()) { 
	 				$('#seaterRl').html('????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#seaterRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#gearR').text()) { 
	 				$('#gearRl').html('???????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'}); 
	 				var offset = $("#gearRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!$('#colorR').text()) { 
	 				$('#colorRl').html('????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	 				var offset = $("#colorRl").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
	        	} else if(!carF.km.value) {
	        		$('#carK').html('????????? ??????????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'}); 
	            	carF.km.focus();
	            } else if(!isKm(carF.km)) {
	            	$('#carK').html('????????? ??????????????? 6?????? ????????? ????????? ????????? ?????????.').css('color', 'red').css({'margin-bottom':'8px','display':'block'});
	            	carF.km.select();
	            } else {
	            	$(this).parents('.select_board').removeClass('board_active');
			        $(this).parents('.select_board').next().addClass('board_active');
			        var i = $(this).parents('.select_board').index();
			        $('.bWrap_header>ul>li').removeClass('selected_header');
			        $('.bWrap_header>ul>li').eq(i + 1).addClass('selected_header');
	            }
	        	return;
			}
			
			if($('#header_car_option').is('.selected_header')){
				
				$(this).parents('.select_board').removeClass('board_active');
		        $(this).parents('.select_board').next().addClass('board_active');
		        var i = $(this).parents('.select_board').index();
		        $('.bWrap_header>ul>li').removeClass('selected_header');
		        $('.bWrap_header>ul>li').eq(i + 1).addClass('selected_header');
				return;
			}
			
			
			if($('#header_car_explain').is('.selected_header')) {
				if(!carF.carPrice.value) {
					$('#carPriceL').html("?????? ????????? ????????? ?????????.").css('color', 'red').css({'margin-bottom':'8px','display':'block'});
					var offset = $("#carPrice").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
				} else if(!carF.catTest.value) {
					$('#catTestL').html("?????? ????????????????????? ????????? ????????? ?????????.").css('color', 'red').css({'margin-bottom':'8px','display':'block'});
					var offset = $("#catTest").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
				} else if(!carF.introdC.value) {
					$('#introdCl').html("?????? ???????????? ????????? ?????????.").css('color', 'red').css({'margin-bottom':'8px','display':'block'});
					var offset = $("#introdC").offset();
	 		        $('html').animate({scrollTop : offset.top-130}, 200);
				} else {
					$(this).parents('.select_board').removeClass('board_active');
			        $(this).parents('.select_board').next().addClass('board_active');
			        var i = $(this).parents('.select_board').index();
			        $('.bWrap_header>ul>li').removeClass('selected_header');
			        $('.bWrap_header>ul>li').eq(i + 1).addClass('selected_header');									
				}
				return;
				
			}
			
			if($('#header_car_picture').is('.selected_header')){
				$(this).parents('.select_board').removeClass('board_active');
		        $(this).parents('.select_board').next().addClass('board_active');
		        var i = $(this).parents('.select_board').index();
		        $('.bWrap_header>ul>li').removeClass('selected_header');
		        $('.bWrap_header>ul>li').eq(i + 1).addClass('selected_header');
		        return;
			}
        })
             
      // ???????????????
	  $('.btn_back').click(function () {
          $(this).parents('.select_board').removeClass('board_active');
          $(this).parents('.select_board').prev().addClass('board_active');

          var i = $(this).parents('.select_board').index();

          $('.bWrap_header>ul>li').removeClass('selected_header');
          $('.bWrap_header>ul>li').eq(i - 1).addClass('selected_header');
      })

        // ????????? ?????????
        $('.selected').click(function () {
            $('.selected').css('border', '1px solid #ededed');
            $(this).css('border', '1px solid #e66b27');
            $('.options-container').removeClass('active');
            $(this).siblings('.options-container').toggleClass('active');
        });

        //????????? option??????
        //$('.option').click(function () {
        $(document).on('click', '.option', function(){
            $(this).siblings().children('input').prop('checked', false);
            $(this).children('input').prop('checked', true);
            $(this).parent().removeClass('active');
            let val = $(this).children('input').val()
            $(this).parent().next().children().text(val);
            $(this).parent().next().css('border', '');
        })


    })
    
        var op1 = 0;
        var op2 = 0;
        var op3 = 0;
        var op4 = 0;
        var op5 = 0;
        var op6 = 0;
        var op7 = 0;

        function func1() {
            if (document.carF.o1.checked) {
                op1 = 5000;
            } else {
                op1 = 0;
            }
            console.log('op1  ' + op1);
            return op1;
        }
        function func2() {
            if (document.carF.o2.checked) {
                op2 = 10000;
            } else {
                op2 = 0;
            }
            console.log('op2  ' + op2);
            return op2;
        }

    function func3() {
        if (document.carF.o3.checked) {
            op3 = 30000;
        } else {
            op3 = 0;
        }
        console.log('op2  ' + op2);
        return op3;
    }
    
    function func4() {
        if (document.carF.o4.checked) {
            op4 = 72000;
        } else {
            op4 = 0;
        }
        console.log('op2  ' + op2);
        return op4;
    }
    
    function func5() {
        if (document.carF.o5.checked) {
            op5 = 30000;
        } else {
            op5 = 0;
        }
        console.log('op2  ' + op2);
        return op5;
    }
    
    function func6() {
        if (document.carF.o6.checked) {
            op6 = 100000;
        } else {
            op6 = 0;
        }
        console.log('op2  ' + op2);
        return op6;
    }
    
    function func7() {
        if (document.carF.o7.checked) {
            op7 = 50000;
        } else {
            op7 = 0;
        }
        console.log('op2  ' + op2);
        return op7;
    }
    

        function car() {
            func1();
            func2();
            func3();
            func4();
            func5();
            func6();
            func7();
            
            document.carF.total.value = 24000 + op1 + op2 + op3 + op4 + op5 + op6 + op7;
        }
    
    
</script>

<jsp:include page="/foot1.jsp" />
package org.fisco.bcos.controllers;

import com.alibaba.fastjson.JSONObject;
import org.fisco.bcos.beans.AccountInfo;
import org.fisco.bcos.beans.CardInfo;
import org.fisco.bcos.clients.AccountContractClient;
import org.fisco.bcos.clients.CardContractClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CardController {
    @Autowired
    HttpServletRequest request;
    //获取卡片信息
    //input: {card_id:}
    //output:
    // onSuccess: {status: "ok", info{name:"", level:"", card_id:"", url:"", is_on_sale:"", price:"", owner:""}}
    @RequestMapping(value = "/get_card_info", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getCardInfo(@RequestBody JSONObject jsonObject){
        JSONObject ret = new JSONObject();
        Object clientObj = request.getSession().getAttribute("card_contract_client");
        //未登录
        if(clientObj == null){
            ret.put("status", "error");
            ret.put("error_type", "client_null");
            return ret.toJSONString();
        }
        CardContractClient client = (CardContractClient)clientObj;
        String cardId = (String)jsonObject.get("card_id");
        //缺少card_id参数
        if(cardId == null){
            ret.put("status","error");
            ret.put("error_type", "lack_card_id");
            return ret.toJSONString();
        }
        CardInfo info = client.getCardInfo(cardId);
        //获取信息失败
        if(info == null){
            ret.put("status", "error");
            ret.put("error", "info_null");
            return ret.toJSONString();
        }
        ret.put("status", "ok");
        ret.put("info", info);
        return ret.toJSONString();
    }

    //input:{card_id:,price:}
    @RequestMapping(value = "/set_card_price", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String setCardPrice(@RequestBody JSONObject jsonObject){
        JSONObject ret = new JSONObject();
        Object clientObj = request.getSession().getAttribute("card_contract_client");
        //未登录
        if(clientObj == null){
            ret.put("error_type", "client_null");
            ret.put("status", "error");
            return ret.toJSONString();
        }
        CardContractClient client = (CardContractClient)clientObj;
        String cardId = (String)jsonObject.get("card_id");
        String price = (String)jsonObject.get("price");
        client.setCardPrice(cardId, price);
        ret.put("status", "ok");
        return ret.toJSONString();
    }
}

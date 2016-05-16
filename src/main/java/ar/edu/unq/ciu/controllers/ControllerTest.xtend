package ar.edu.unq.ciu.controllers

import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest

@Controller
class ControllerTest {
    extension JSONUtils = new JSONUtils

    @Get('/test')
    def test(){
        response.contentType = "application/json"
        try {
            ok(tests.toJson)
        }
        catch (UserException e) {
            notFound(e.message);
        }
    }

    def tests(){
        newArrayList("lala", "lele", "lili", "lolo", "lulu")
    }

    def static void main(String[] args) {
        XTRest.start(ControllerTest, 9000)
    }
}
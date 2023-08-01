import idanalyzer
import re
import requests

#@get_https
def verify_details(dn, ad, image):
    try:
        coreapi = idanalyzer.CoreAPI("zaCELgL.0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx", "IN")

        coreapi.throw_api_exception(True)

        coreapi.enable_authentication(True, 'quick')

        response = coreapi.scan(document_primary=image, biometric_photo=image)

        if response.get('result'):
            data_result = response['result']

        if response.get('authentication'):
            authentication_result = response['authentication']
            if authentication_result['score'] > 0.5:
                print("The document uploaded is authentic")
            elif authentication_result['score'] > 0.3:
                print("The document uploaded looks little bit suspicious")
            else:
                print("The document uploaded is fake")

        if response.get('face'):
            face_result = response['face']
            if face_result['isIdentical']:
                print("Face verification PASSED!")
            else:
                print("Face verification FAILED!")

            print("Confidence Score: "+face_result['confidence'])

    except Exception as e:
        details = e.args[0]
    

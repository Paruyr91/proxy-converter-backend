import { HttpStatus } from '@nestjs/common';
import { DefaultHttpException } from '@common/exceptions/http.exception';
import { ResponseStatusCodes } from '@common/dto/response-status.dto';

export class InternalServerErrorException extends DefaultHttpException {
  constructor(
    message?: string,
    failureReasons = ResponseStatusCodes.InternalServerError,
    title?: string,
  ) {
    super({
      message: message,
      statusCode: HttpStatus.INTERNAL_SERVER_ERROR,
      code: failureReasons,
      title: title,
    });
  }
}

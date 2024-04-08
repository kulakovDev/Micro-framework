<?php

namespace Igarevv\Micrame\Http;

class Response
{

    public function __construct(
      protected string $content = '',
      protected int $status = 200
    ) {}

    public function send(): void
    {
        http_response_code($this->status);

        echo $this->content;
    }

    public function json(): Response
    {
        $this->content = json_encode($this->content, JSON_THROW_ON_ERROR);

        return $this;
    }
}
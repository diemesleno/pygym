from django.core.mail.message import EmailMessage


def send_mail(subject, message, user_email):
    """
    Simple function to send email as test
    """
    from_email = 'contact_test@virtuagym.com'
    send_email = EmailMessage(
        subject=subject,
        body=message,
        from_email=from_email,
        to=[from_email, ],
        headers={'Reply-To': user_email}
    )
    send_email.send()
